# API Nghĩa Trang Liệt Sĩ Đồng Tháp

## Hướng dẫn cài đặt

### Cài đặt cho môi trường phát triển

1. Cài đặt Docker: https://docs.docker.com/engine/install/
2. Cài đặt Docker Compose: https://docs.docker.com/compose/install/
3. Clone project: `git clone https://github.com/WebLietSi/weblietsi-backend.git`
4. Di chuyển vào thư mục project: `cd weblietsi-backend`
5. Tạo volume cho PostgreSQL: `docker volume create weblietsi-postgres`
6. Tạo file .env từ mẫu: `cp .env.example .env`
7. Chạy môi trường dev: `docker-compose -f docker-compose-dev.yml up -d`
8. Truy cập: `http://localhost:8080/swagger-ui/index.html`

### Cài đặt cho môi trường production

1. Chuẩn bị môi trường:
   ```bash
   # Tạo thư mục SSL và backups
   mkdir -p ssl backups
   
   # Tạo volume PostgreSQL
   docker volume create weblietsi-postgres
   
   # Tạo file .env từ mẫu
   cp .env.prod .env
   ```

2. Cấu hình SSL:
   - Đặt certificate vào thư mục `ssl`:
     - `ssl.crt`: SSL certificate
     - `ssl.key`: Private key
   - Tạo keystore:
   ```bash
   openssl pkcs12 -export \
     -in ssl/ssl.crt \
     -inkey ssl/ssl.key \
     -out ssl/keystore.p12 \
     -name lietsi \
     -password pass:your-keystore-password
   ```

3. Cấu hình môi trường:
   Chỉnh sửa file `.env` với các thông số:
   ```bash
   MAIL_USERNAME=email-username
   MAIL_PASSWORD=email-password
   MAIL_HOST=smtp.example.com
   MAIL_PORT=587
   DB_PASSWORD=secure-database-password
   SSL_PASSWORD=your-keystore-password
   SSL_ALIAS=lietsi
   ```

4. Khởi chạy ứng dụng:
   ```bash
   docker-compose -f docker-compose.prod.yml up -d
   ```

5. Kiểm tra trạng thái:
   ```bash
   docker-compose -f docker-compose.prod.yml ps
   ```

### Ports

- HTTP: 8080
- HTTPS: 8443

### Backup Database

- Tự động: Thực hiện hàng ngày, lưu tại `./backups`
- Thủ công: Chạy script `./backup.sh`

### Khôi phục Database

```bash
# Khôi phục từ file backup
docker exec -i lietsi-postgis psql -U postgres lietsi < ./backups/backup-file.sql
```

### Monitoring

- Logs:
  ```bash
  docker-compose -f docker-compose.prod.yml logs -f app
  ```

### Security

- Tất cả traffic HTTP sẽ tự động chuyển sang HTTPS
- SSL/TLS được cấu hình theo tiêu chuẩn bảo mật
- Database được backup tự động hàng ngày

### Troubleshooting

1. Kiểm tra logs:
   ```bash
   docker-compose -f docker-compose.prod.yml logs -f
   ```

2. Restart service:
   ```bash
   docker-compose -f docker-compose.prod.yml restart app
   ```

3. Kiểm tra SSL:
   ```bash
   openssl s_client -connect localhost:8443
   ```