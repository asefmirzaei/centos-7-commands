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
# show nginx files
rpm -ql nginx 
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
# ================================================== uninstall ================================================
sudo systemctl stop nginx.service
sudo systemctl disable nginx.service
sudo userdel -r nginx
sudo yum remove -y nginx nginx-common
sudo yum remove -y nginx*
sudo yum autoremove -y autoclean
sudo rm -rf /etc/nginx
sudo rm -rf /etc/init.d/nginx
sudo rm -rf /var/log/nginx
sudo rm -rf /var/cache/nginx
sudo rm -rf /usr/sbin/nginx
sudo rm -rf /usr/lib/systemd/system/nginx.service
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
    server_name yoursitename.com www.yoursitename.com;

    #--------------- compression settings ---------------
    gzip on;
    gzip_static on;
    gzip_vary on;
    gzip_comp_level 8;
    gzip_http_version 1.0;
    gzip_buffers 16 8k;
    gzip_min_length 128;
    # gzip_proxied any;
    gzip_proxied expired no-cache no-store private no_last_modified no_etag auth;
    gzip_disable "MSIE [1-6]\.(?!.*SV1)";
    # gzip_types application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.openxmlformats-officedocument.presentationml.presentation
    gzip_types application/atom+xml application/json application/ld+json application/rss+xml application/geo+json application/xml application/rdf+xml application/wasm application/manifes+json application/x-web-app-manifest+json application/msword application/vnd.ms-excel application/vnd.ms-powerpoint application/vnd.ms-fontobject application/java-archive application/mac-binhex40 application/octet-stream application/pdf application/postscript application/rtf application/vnd.google-earth.kml+xml application/vnd.google-earth.kmz application/vnd.wap.wmlc application/x-7z-compressed application/x-bb-appworld application/x-bittorrent application/x-chrome-extension application/x-cocoa application/x-java-archive-diff application/x-java-jnlp-file application/x-makeself application/x-opera-extension application/x-perl application/x-pilot application/x-rar-compressed application/x-redhat-package-manager application/x-sea application/x-shockwave-flash application/x-stuffit application/x-tcl application/x-x509-ca-cert application/x-xpinstall application/xhtml+xml application/xslt+xml application/zip text/cache-manifest text/javascript text/calendar text/css text/csv text/markdown text/mathml text/plain text/vcard text/vnd.rim.location.xloc text/vnd.sun.j2me.app-descriptor text/vnd.wap.wml text/vtt text/x-component audio/midi audio/mp4 audio/mpeg  audio/ogg audio/x-realaudio audio/x-wav image/apng image/avif image/bmp image/gif image/jpeg image/jxl image/jxr image/png image/svg+xml image/tiff image/vnd.wap.wbmp image/webp image/x-jng image/x-icon video/3gpp video/mp4 video/mpeg video/ogg video/quicktime video/webm video/x-flv video/x-mng video/x-ms-asf video/x-msvideo font/woff font/woff2 font/ttf font/collection font/otf;

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
      #--------------- cache settings ---------------
      # proxy_ignore_headers Cache-Control;
      add_header X-Cache-Status $upstream_cache_status;
      slice 1m;
      proxy_cache cache;
      proxy_cache_key $proxy_host$request_uri$cookie_jessionid;
      proxy_cache_valid any 1m;
      proxy_cache_min_uses 3;
      proxy_cache_bypass $http_upgrade $cookie_nocache $arg_nocache$arg_comment;
      proxy_cache_methods GET HEAD POST;
      proxy_cache_use_stale error timeout http_500 http_502 http_503 http_504;
      proxy_cache_revalidate on;
      proxy_cache_background_update on;
      proxy_cache_lock on;
	
      proxy_http_version 1.1;
      proxy_redirect off;
      proxy_set_header Upgrade $http_upgrade;
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
  alias /var/www/storages;
}
# ================================================== allow access control allow origin ========================
if you whant allow access control allow origin in same block add following commands in yoursitenmae.com.conf file for root,main domain,subdomain and subdirectory :

location /fonts {
  alias /root/apps/storages/fonts;
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
