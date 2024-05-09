FROM node:16

LABEL maintainer="Klaudia Olma"

WORKDIR /jestApp

RUN git clone https://github.com/Royalblondy/jest-example-app.git

WORKDIR /jestApp/jest-example-app

RUN yarn install --production
RUN yarn run build