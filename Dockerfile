FROM node:22.14-slim AS base
COPY . /app
WORKDIR /app

FROM base AS deps

RUN yarn install --prod --frozen-lockfile

FROM base AS build

RUN yarn install --frozen-lockfile
RUN yarn run build

FROM base

COPY --from=deps /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist

EXPOSE 3000

CMD [ "yarn", "start" ]
