FROM jestapp:build

CMD ["yarn", "test", "--watch=false"]