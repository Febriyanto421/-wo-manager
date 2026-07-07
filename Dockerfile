FROM alpine:latest

# Install dependensi biar bisa download dan ekstrak
RUN apk add --no-cache unzip ca-certificates

# Download langsung file PocketBase versi Linux dari GitHub
ADD https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_linux_amd64.zip /tmp/pocketbase.zip

# Ekstrak dan beri izin jalan
RUN unzip /tmp/pocketbase.zip -d /pb && \
    chmod +x /pb/pocketbase

# Copy file HTML website ke dalam folder PocketBase
COPY index.html /pb/index.html

# Masuk ke folder kerja
WORKDIR /pb

# Buka port 8090
EXPOSE 8090

# Perintah buat menjalankan PocketBase
CMD ["./pocketbase", "serve", "--dir", "./pb_data", "--publicDir", "./"]