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

    # Lightning addresses and NIP-05 are served by the mint. Proxied, not
    # redirected: NIP-05 clients must ignore redirects.
    location ^~ /.well-known/lnurlp/ {
        proxy_pass https://mint.600.wtf;
        proxy_set_header Host mint.600.wtf;
        proxy_ssl_server_name on;
        proxy_hide_header Access-Control-Allow-Origin;
        add_header Access-Control-Allow-Origin "*" always;
    }

    location ^~ /.well-known/lnurlw/ {
        proxy_pass https://mint.600.wtf;
        proxy_set_header Host mint.600.wtf;
        proxy_ssl_server_name on;
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
