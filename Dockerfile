FROM nginx:alpine

COPY . /usr/share/nginx/html

RUN cat > /etc/nginx/conf.d/default.conf <<'EOF'
server {
    listen 80;
    server_name _;

    root /usr/share/nginx/html;
    index index.html;

    location ^~ /.well-known {
        add_header Access-Control-Allow-Origin "*" always;
    }

    # Lightning addresses (e.g. dni@600.wtf) are served by the lnurl-mint
    # container, which runs with host networking on port 8111. Proxied, not
    # redirected: NIP-05 clients must ignore redirects. host.docker.internal
    # comes from `--add-host=host.docker.internal:host-gateway` (see Makefile).
    location ^~ /.well-known/lnurlp/ {
        proxy_pass http://host.docker.internal:8111;
        proxy_set_header Host mint.600.wtf;
        proxy_set_header X-Forwarded-Proto https;
        proxy_hide_header Access-Control-Allow-Origin;
        add_header Access-Control-Allow-Origin "*" always;
    }

    location ^~ /.well-known/lnurlw/ {
        proxy_pass http://host.docker.internal:8111;
        proxy_set_header Host mint.600.wtf;
        proxy_set_header X-Forwarded-Proto https;
        proxy_hide_header Access-Control-Allow-Origin;
        add_header Access-Control-Allow-Origin "*" always;
    }

    # location = /.well-known/nostr.json {
    #     proxy_pass https://mint.600.wtf;
    #     proxy_set_header Host mint.600.wtf;
    #     proxy_ssl_server_name on;
    #     proxy_hide_header Access-Control-Allow-Origin;
    #     add_header Access-Control-Allow-Origin "*" always;
    # }

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

EXPOSE 80
