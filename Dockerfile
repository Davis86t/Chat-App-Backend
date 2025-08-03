FROM alpine:3.18

WORKDIR /app

RUN apk add --no-cache curl unzip libc6-compat

# Download and unzip PocketBase
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.23.3/pocketbase_0.23.3_linux_amd64.zip -o pb.zip \
  && unzip pb.zip \
  && rm pb.zip \
  && chmod +x pocketbase

# Expose PocketBase port
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
