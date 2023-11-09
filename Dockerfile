# 依存パッケージのインストール
FROM node:21-alpine3.17 as builder

FROM node:16
WORKDIR /app
# packeg.jsonとpackage-lock.jsonのみコピーする
#COPY package*.json ./
COPY . .
RUN npm install
RUN npm run build


## Build環境
#FROM node:21-alpine3.17 as builder
#WORKDIR /app
#COPY . .
# depsステージでインストールしたパッケージをコピーする
#COPY --from=deps /app/node_modules ./node_modules
#RUN npm run build


# 実行環境
#FROM node:21-alpine3.17
#WORKDIR /app
#ENV NODE_ENV production
# ファビコンが格納されたディレクトリをコピーする
#COPY --from=builder /app/public ./public
## buildによって.next配下に生成されたhtml、JSON、JSファイルをコピーする
#COPY --from=builder /app/.next ./.next
#COPY --from=builder /app/package.json ./package.json
EXPOSE 3000
CMD [ "npm", "run", "dev" ]
