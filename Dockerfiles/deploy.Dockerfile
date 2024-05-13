FROM node:16

LABEL maintainer="Klaudia Olma"

COPY --from=jestapp:build /jestApp/jest-example-app/build /server/build
WORKDIR server

RUN npm install -g serve

EXPOSE 3000

CMD ["serve", "-s", "build"]