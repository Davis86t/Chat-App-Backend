FROM alpine:3.18

WORKDIR /app
RUN apk add --no-cache curl libc6-compat unzip

ENV PB_VERSION=0.23.3
RUN curl -L "https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip" -o pb.zip \
  && unzip pb.zip \
  && rm pb.zip \
  && chmod +x pocketbase

COPY pb_migrations ./pb_migrations

EXPOSE 8090
CMD ["sh", "-c", "echo '--- Checking /data before starting PocketBase ---' && ls -la /data && echo '--- Starting PocketBase ---' && ./pocketbase serve --http=0.0.0.0:8090 --dir /data"]

