FROM node:20

WORKDIR /app

COPY package.json .
COPY package-lock.json .
COPY main.js .
COPY public public 
COPY views views

RUN npm ci

ENV APP_PORT=3000

EXPOSE ${APP_PORT}

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD curl localhost:${APP_PORT}/heath || exit 1

#how to start the program
ENTRYPOINT ["node", "main.js"]
