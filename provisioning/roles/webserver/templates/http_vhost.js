server {
  listen 80;
  server_name  www.{{ domain }};
  rewrite ^/(.*) http://{{ domain }}/$1 permanent;
}

server {
  listen 80;
  server_name {{ domain }};
{% if htpasswd_user and htpasswd_password %}
  auth_basic "Restricted";
  auth_basic_user_file htpasswd;
{% endif %}

  access_log  /var/log/nginx/{{ app }}_access.log;
  error_log  /var/log/nginx/{{ app }}_error.log;

  merge_slashes on;

  root /home/{{ user }}/current;
  error_page 404 /404/index.html;
  error_page 500 501 502 503 504 /50x.html;
}
