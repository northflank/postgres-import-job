FROM alpine:latest

WORKDIR /app

COPY . .

RUN chmod +x run.sh && apk add postgresql-client

ENTRYPOINT ["./run.sh"]