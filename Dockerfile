FROM node:14.8.0-buster-slim

ENV HEXO_PORT=4000
EXPOSE ${HEXO_SERVER_PORT}

RUN apt-get update && \
    apt-get install git -y
RUN npm install hexo-cli@4.2.0 -g \
                hexo-reading-time \
                hexo-generator-seo-friendly-sitemap \
                hexo-related-popular-posts \
                hexo-tag-twitter \
                hexo-generator-searchdb \
                hexo-generator-search \
                hexo-github-card \
                hexo-oembed \
                hexo-asset-image \
                @heowc/hexo-tag-gdemo \
                hexo-optimize --verbose --save && \
                echo "*** INSTALLED: hexo and modules ***"

WORKDIR /app
RUN git clone https://github.com/Klaudioz/hexo-blog.git /app && \
    npm install && \
    cp index.js ./node_modules/hexo-asset-image/index.js

CMD hexo server -d -p ${HEXO_PORT}
