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

    location ^~ /.well-known/lnurlp {
        default_type "application/json; charset=utf-8";
        add_header Access-Control-Allow-Origin "*" always;
    }

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

EXPOSE 80
