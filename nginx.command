# ================================================== install ==================================================
# first install firewalld
sudo yum update -y
sudo yum install epel-release -y
sudo yum info nginx
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo nginx -v
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo chown -R $USER:$USER /var/www/yoursitename
check your host ip in browser
config your nginx file in /etc/nginx

sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
sudo systemctl disable nginx
sudo systemctl enable nginx
sudo systemctl status nginx

# ================================================== set ssl ==================================================
create primary.crt,private.key and bundle.crt file in your server or ssl provider.
put all 3 files in one folder and path.
add new server block in sitename.com.conf
add the following commands to the file:

server {
    listen 443 http2 ssl;
    listen [::]:443 http2 ssl;

    root /var/www/yoursitename;
    index index.html index.htm index.nginx-debian.html;
    server_name yoursitename.ir www.yoursitename.com;

    charset utf-8;
    gzip on;
    gzip_static on;
    gzip_vary on;
    gzip_comp_level 6;
    gzip_http_version 1.1;
    gzip_buffers 16 8k;
    gzip_min_length 1100;
    gzip_proxied expired no-cache no-store private auth;
    gzip_types text/plain text/js text/xml text/javascript application/javascript application/json application/xml application/rss+xml image/svg+xml svg svgz;
    gzip_disable "MSIE [1-6]\.(?!.*SV1)";

    ssl on;
    ssl_certificate           /var/www/ssl/yoursitename/server.crt;
    ssl_certificate_key       /var/www/ssl/yoursitename/server.key;
    ssl_protocols             TLSv1 TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers               "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA HIGH !RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS";
    ssl_ecdh_curve            secp384r1;
    ssl_session_cache         shared:SSL:10m;
    ssl_session_tickets       off;
    ssl_stapling              on;
    ssl_stapling_verify       on;
    resolver                  8.8.8.8 8.8.4.4 valid=300s;
    resolver_timeout          5s;
    add_header                Strict-Transport-Security "max-age=63072000; includeSubdomains; preload";
    add_header                X-Content-Type-Options nosniff;
    add_header                X-XSS-Protection "1; mode=block";
    
    location / {
      proxy_pass http://localhost:3000;
      proxy_http_version 1.1;
      proxy_redirect off;
      proxy_set_header Upgrade $http_upgrade;
      proxy_cache_bypass $http_upgrade;
      proxy_set_header X-Forwarded-Host $host;
      proxy_set_header X-Forwarded-Server $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header Host $http_host;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "Upgrade";
      proxy_pass_request_headers on;
      proxy_set_header Authorization $http_authorization;
      proxy_pass_header Authorization;
      add_header 'Access-Control-Allow-Credentials' 'true';
      proxy_connect_timeout 2000s;
      proxy_send_timeout 2000s;
      proxy_read_timeout 2000s;
      fastcgi_send_timeout 2000s;
      fastcgi_read_timeout 2000s;
      add_header Last-Modified $date_gmt;
      add_header Cache-Control 'no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0';
      if_modified_since off;
      expires off;
      etag off;
      
      access_log /var/log/nginx/api.access.log;
      error_log /var/log/nginx/api.error.log;
    }
    
    error_page 404 /404.html;
    location = /40x.html {
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
    }
}

if you whant force redirect http to https add:
return 301 https://$host$request_uri;
to your http server block

# ================================================== set download location in your site =======================
add the following commands to the http and https block in yoursitenmae.com.conf file:
location /downloads {
  alias /var/www/storages/photos;
}
# ================================================== allow access control allow origin ========================
if you whant allow access control allow origin in same block add following commands in yoursitenmae.com.conf file for root,main domain,subdomain and subdirectory :

location /fonts {
  alias /root/apps/storages/fonts/;
  if ($request_method = 'OPTIONS') {
    add_header 'Access-Control-Allow-Origin' '*' always;
  }
  if ($request_method = 'POST') {
    add_header 'Access-Control-Allow-Origin' '*' always;
  }
  if ($request_method = 'GET') {
    add_header 'Access-Control-Allow-Origin' '*' always;
  }
  if ($request_method = 'PUT') {
    add_header 'Access-Control-Allow-Origin' '*' always;
  }
  if ($request_method = 'PATCH') {
    add_header 'Access-Control-Allow-Origin' '*' always;
  }
  if ($request_method = 'DELETE') {
    add_header 'Access-Control-Allow-Origin' '*' always;
  }
}
# ================================================== commands =================================================
# test your nginx configuration files:
sudo nginx -t
# reset your nginx configuration:
sudo systemctl restart nginx
# proxy pass external site in yoursite,subdomain or subdirectory :
proxy_pass https://externalsite.com$request_uri;
