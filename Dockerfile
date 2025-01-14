FROM node:17 as npmbuilder
WORKDIR /app
COPY . .
RUN npm install -g pnpm@next-7 && npm install -g typescript && npm install && pnpm run build


FROM golang:1.18 as gobuilder
WORKDIR /app
COPY --from=npmbuilder /app .
RUN go build


FROM golang:1.18 
WORKDIR /app
COPY --from=gobuilder /app .
EXPOSE 8042
CMD ["./grafisearch"]

