FROM node:18-alpine3.20 AS build

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

# Aqui baixa todas as dependencias, pq tem uma em dev que é necessária para o 
# yarn run build
RUN yarn

COPY . .

RUN yarn run build

# Baixar somente dependencias de produção e limpar cache das dev dependences
# baixadas na etapa anterior

# RUN yarn workspaces focus --production (esse só funciona na nova versão 2 do yarn)
RUN yarn install --production && yarn cache clean

FROM node:18-alpine3.20

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD ["yarn", "run", "start:prod"]