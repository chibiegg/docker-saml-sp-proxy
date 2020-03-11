FROM centos:7

RUN yum install -y epel-release xmlsec1 xmlsec1-openssl gettext

RUN curl -sSL -o /etc/yum.repos.d/hnakamur-luajit.repo https://copr.fedoraproject.org/coprs/hnakamur/luajit/repo/epel-7/hnakamur-luajit-epel-7.repo
RUN curl -sSL -o /etc/yum.repos.d/hnakamur-nginx.repo https://copr.fedoraproject.org/coprs/hnakamur/nginx/repo/epel-7/hnakamur-nginx-epel-7.repo

RUN yum install -y nginx

RUN ln -s /usr/lib64/libz.so.1 /usr/lib64/libz.so

ADD files/nginx.conf /etc/nginx/nginx.conf
ADD files/default.conf /etc/nginx/conf.d/default.conf.template
ADD files/config.lua /etc/nginx/lua/saml/service_provider/config.lua.template
ADD files/idp.crt /etc/nginx/idp.crt
ADD files/localhost.crt /etc/nginx/server.crt
ADD files/localhost.key /etc/nginx/server.key

RUN mkdir /etc/nginx/default.d

ADD files/entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENV NGINX_SERVER_NAME="_"
ENV SAML_IDP_LOGIN_URL="https://idp.example.net/sso_redirect"
ENV SAML_IDP_CERTIFICATE_FILE="/etc/nginx/idp.crt"
ENV SAML_SP_ENTRY_ID="https://localhost/sso"
ENV SAML_SP_ACS_URL="https://localhost/sso/finish-login"
ENV SAML_USERNAME_ATTRIBUTE_NAME="username"

ENTRYPOINT ["/opt/entrypoint.sh"]
EXPOSE 80
EXPOSE 443
