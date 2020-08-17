FROM alpine:3.10
RUN apk add --no-cache curl bash
COPY download-from-github.sh /
RUN bash /download-from-github.sh

FROM mhart/alpine-node
RUN npm install hexo-cli -g
WORKDIR /blog/
COPY docker-entrypoint.sh /entrypoint.sh
RUN \
    hexo init hexo-blog

COPY --from=0 /opt/klaudioz.github.io-master /blog/public
EXPOSE 4000
ENTRYPOINT ["/entrypoint.sh"]
CMD ["server"]
