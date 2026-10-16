FROM lambci/lambda:build-nodejs12.x

ENV ROOT_DIR /usr/local/pdfkit

RUN mkdir -p $ROOT_DIR

ADD package.json $ROOT_DIR
ADD package-lock.json $ROOT_DIR
ADD .npmrc $ROOT_DIR

WORKDIR $ROOT_DIR

RUN npm install -g npm@v7 --registry=https://npm.flatt.tech/ && \
  npm install --no-bin-links --production --ignore-scripts

CMD ["node",  "--version"]
