#!/usr/bin/env bash

rm -rf objs
mkdir -p objs/external
echo "==>>> Unpack openssl"
tar xzf ./nb/openssl-3.*.tar.gz -C ./objs/external/
mv ./objs/external/openssl-* ./objs/external/openssl

echo "==>>> Unpack zlib"
tar xzf ./nb/zlib-*.tar.gz -C ./objs/external/
mv ./objs/external/zlib-* ./objs/external/zlib

echo "==>>> Unpack pcre"
tar xjf ./nb/pcre2-*.tar.bz2 -C ./objs/external/
mv ./objs/external/pcre* ./objs/external/pcre


./configure --prefix=/usr/share/nbng \
--sbin-path=/usr/bin/nbng \
--conf-path=/etc/nbng.conf \
--with-cc-opt='-w -static -Ofast -fPIC' \
--with-ld-opt='-s -static -fPIC'   \
--error-log-path=stderr \
--pid-path=/var/run/nbng.pid  \
--lock-path=/var/run/nbng.lock  \
--http-client-body-temp-path=/var/run/nbng/client_body_temp  \
--http-proxy-temp-path=/var/run/nbng/proxy_temp  \
--http-fastcgi-temp-path=/var/run/nbng/fastcgi_temp  \
--http-uwsgi-temp-path=/var/run/nbng/uwsgi_temp  \
--http-scgi-temp-path=/var/run/nbng/scgi_temp  \
--http-log-path=/var/log/nbng_access.log  \
--error-log-path=/var/log/nbng_error.log  \
--with-compat \
--with-debug \
--with-select_module \
--with-poll_module \
--with-threads \
--with-http_ssl_module   \
--with-http_v2_module    \
--with-http_v3_module    \
--with-http_realip_module  \
--with-http_addition_module     \
--with-http_sub_module            \
--with-http_dav_module             \
--with-http_flv_module             \
--with-http_mp4_module             \
--with-http_gunzip_module          \
--with-http_gzip_static_module     \
--with-http_auth_request_module    \
--with-http_random_index_module    \
--with-http_secure_link_module     \
--with-http_degradation_module     \
--with-http_slice_module           \
--with-http_stub_status_module     \
--with-stream                      \
--with-stream_ssl_module           \
--with-stream_realip_module        \
--with-stream_ssl_preread_module   \
--with-mail_ssl_module \
--with-pcre=objs/external/pcre   \
--with-pcre-jit    \
--with-zlib=objs/external/zlib \
--with-openssl=objs/external/openssl

make -j8

mkdir -p release
cp objs/nginx release/nbng

echo "===>> ALL DONE ==="

