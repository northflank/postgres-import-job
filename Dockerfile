FROM alpine:latest

WORKDIR /app

COPY . .

RUN chmod +x *.sh && apk add postgresql-client

ENTRYPOINT ["./run.sh"]
