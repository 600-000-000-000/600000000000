import { expect, test } from "@playwright/test";
import { existsSync, readFileSync, statSync } from "node:fs";
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

test("members.json references local image assets", () => {
  const missingImages = getValidMembers()
    .map(member => member.img)
    .filter(imagePath => {
      const normalizedPath = imagePath.replace(/\//g, path.sep);
      const absolutePath = path.resolve(__dirname, "..", normalizedPath);

      return !existsSync(absolutePath) || statSync(absolutePath).size === 0;
    });

  expect(missingImages).toEqual([]);
});

test("home page renders every member image", async ({ page }) => {
  const members = getValidMembers();

  await page.goto("/");
  await expect(page.locator("#team .team")).toHaveCount(members.length);

  const brokenImages = await page.locator("#team img").evaluateAll(images => {
    return images
      .filter(image => {
        const candidate = image as HTMLImageElement;
        return !candidate.complete || candidate.naturalWidth <= 0 || candidate.naturalHeight <= 0;
      })
      .map(image => image.getAttribute("src") || "");
  });

  expect(brokenImages).toEqual([]);
});
