FROM alpine:3.18

WORKDIR /app

RUN apk add --no-cache curl libc6-compat unzip

RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.23.3/pocketbase_0.23.3_linux_amd64.zip -o pb.zip \
  && unzip pb.zip \
  && rm pb.zip \
  && chmod +x pocketbase

COPY pb_data ./pb_data
COPY pb_migrations ./pb_migrations

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
