import { expect, test } from "@playwright/test";
import { readFileSync, statSync } from "node:fs";
import path from "node:path";

type Member = {
  name: string;
  role: string;
  img: string;
  nostr: string;
};

function getValidMembers(): Member[] {
  const source = readFileSync(path.resolve(__dirname, "../members.json"), "utf8");
  const json = JSON.parse(source) as { members?: unknown[] };

  if (!Array.isArray(json.members)) {
    return [];
  }

  return json.members.filter((member): member is Member => {
    if (!member || typeof member !== "object") {
      return false;
    }

    const candidate = member as Partial<Member>;
    return Boolean(
      typeof candidate.name === "string" && candidate.name.trim() &&
        typeof candidate.role === "string" && candidate.role.trim() &&
        typeof candidate.img === "string" && candidate.img.trim() &&
        typeof candidate.nostr === "string" && candidate.nostr.trim()
    );
  });
}

test("smoke load exposes grid, preview, and controls", async ({ page }) => {
  await page.goto("/business-card.html");
  await expect(page.getByTestId("member-grid")).toBeVisible();
  await expect(page.getByTestId("preview-card")).toBeVisible();
  await expect(page.getByTestId("export-controls")).toBeVisible();
  await expect(page.getByTestId("export-button")).toBeEnabled();
});

test("member count matches valid entries in members.json", async ({ page }) => {
  const validMembers = getValidMembers();
  await page.goto("/business-card.html");
  await expect(page.getByTestId("member-item")).toHaveCount(validMembers.length);
});

test("default selection populates preview content", async ({ page }) => {
  const validMembers = getValidMembers();
  await page.goto("/business-card.html");

  await expect(page.locator('[data-testid="member-item"]').first()).toHaveAttribute("aria-pressed", "true");
  await expect(page.locator("#business-preview-name")).toHaveText(validMembers[0].name);
  await expect(page.locator("#business-preview-role")).toHaveText(validMembers[0].role);
  await expect(page.locator("#business-preview-nostr")).toHaveAttribute("href", new RegExp(validMembers[0].nostr));
});

test("clicking a member changes selected state without triggering a PDF download", async ({ page }) => {
  const validMembers = getValidMembers();
  await page.goto("/business-card.html");

  const secondMember = page.locator('[data-testid="member-item"]').nth(1);
  let downloaded = false;

  page.on("download", () => {
    downloaded = true;
  });

  await secondMember.click();
  await page.waitForTimeout(300);

  await expect(secondMember).toHaveAttribute("aria-pressed", "true");
  await expect(page.locator("#business-preview-name")).toHaveText(validMembers[1].name);
  expect(downloaded).toBeFalsy();
});

test("print fallback calls window.print exactly once", async ({ page }) => {
  await page.addInitScript(() => {
    (window as unknown as { __printCalls: number }).__printCalls = 0;
    window.print = () => {
      (window as unknown as { __printCalls: number }).__printCalls += 1;
    };
  });

  await page.goto("/business-card.html");
  await page.getByTestId("print-button").click();

  await expect.poll(async () => {
    return page.evaluate(() => {
      return (window as unknown as { __printCalls: number }).__printCalls;
    });
  }).toBe(1);
});

test("explicit export button downloads a non-empty PDF", async ({ page }) => {
  await page.goto("/business-card.html");

  const [download] = await Promise.all([
    page.waitForEvent("download"),
    page.getByTestId("export-button").click()
  ]);

  const filePath = await download.path();
  expect(download.suggestedFilename().endsWith(".pdf")).toBeTruthy();

  if (!filePath) {
    throw new Error("Expected downloaded file path");
  }

  const size = statSync(filePath).size;
  expect(size).toBeGreaterThan(512);
});

test("member clicks are ignored while export is already running", async ({ page }) => {
  const validMembers = getValidMembers();

  await page.goto("/business-card.html");

  await page.evaluate(() => {
    const exporter = () => {
      const chain = {
        set: () => chain,
        from: () => chain,
        save: () => new Promise(resolve => {
          window.setTimeout(resolve, 400);
        })
      };

      return chain;
    };

    Object.defineProperty(window, "html2pdf", {
      configurable: true,
      value: exporter
    });
  });

  const secondMember = page.locator('[data-testid="member-item"]').nth(1);
  const exportPromise = page.getByTestId("export-button").click();

  await expect(page.getByTestId("export-button")).toHaveText("Exporting...");
  await secondMember.click({ force: true });
  await expect(page.locator("#business-preview-name")).toHaveText(validMembers[0].name);

  await exportPromise;
  await expect(page.getByTestId("export-button")).toHaveText("Export Selected PDF");
});

test("fetch failure shows error state and disables export actions", async ({ page }) => {
  await page.route("**/members.json", route => {
    route.fulfill({
      status: 500,
      contentType: "application/json",
      body: JSON.stringify({ error: "failed" })
    });
  });

  await page.goto("/business-card.html");

  await expect(page.getByTestId("error-state")).toBeVisible();
  await expect(page.getByTestId("export-button")).toBeDisabled();
  await expect(page.getByTestId("print-button")).toBeDisabled();
});

test("empty member data shows error and no selectable members", async ({ page }) => {
  await page.route("**/members.json", route => {
    route.fulfill({
      status: 200,
      contentType: "application/json",
      body: JSON.stringify({ members: [] })
    });
  });

  await page.goto("/business-card.html");

  await expect(page.getByTestId("error-state")).toBeVisible();
  await expect(page.getByTestId("member-item")).toHaveCount(0);
  await expect(page.getByTestId("export-button")).toBeDisabled();
});

test("mobile viewport keeps core controls visible and interactive", async ({ page }) => {
  await page.setViewportSize({ width: 375, height: 812 });
  await page.goto("/business-card.html");

  await expect(page.getByTestId("member-grid")).toBeVisible();
  await expect(page.getByTestId("export-button")).toBeVisible();
  await expect(page.getByTestId("print-button")).toBeVisible();

  const hasHorizontalOverflow = await page.evaluate(() => {
    return document.documentElement.scrollWidth > window.innerWidth + 1;
  });

  expect(hasHorizontalOverflow).toBeFalsy();
});

test("page load and export path have no uncaught console errors", async ({ page }) => {
  const errors: string[] = [];

  page.on("pageerror", error => {
    errors.push(error.message);
  });

  page.on("console", message => {
    if (message.type() === "error") {
      errors.push(message.text());
    }
  });

  await page.goto("/business-card.html");
  await Promise.all([
    page.waitForEvent("download"),
    page.getByTestId("export-button").click()
  ]);

  expect(errors).toEqual([]);
});
