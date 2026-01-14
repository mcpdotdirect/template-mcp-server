
FROM oven/bun:1.2-alpine

WORKDIR /app

COPY package.json bun.lock ./

RUN bun install --production

COPY . .

RUN bun run build

ARG PORT=3000

ENV PORT=${PORT}

EXPOSE ${PORT}

CMD [ "bun", "run", "start:http" ] 