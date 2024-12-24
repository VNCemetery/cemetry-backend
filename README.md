# API Nghĩa Trang Liệt Sĩ Đồng Tháp

## Hướng dẫn cài đặt

### Cài đặt cho môi trường phát triển

1. Cài đặt Docker: https://docs.docker.com/engine/install/
2. Cài đặt Docker Compose: https://docs.docker.com/compose/install/
3. Clone project về máy: `git clone https://github.com/WebLietSi/weblietsi-backend.git`
4. Di chuyển vào thư mục project: `cd weblietsi-backend`
5. Tạo volume cho MariaDB và Maven: `docker volume create weblietsi-postgres && docker volume create maven-repo`
6. Chạy lệnh `docker-compose --env-file .env up -d --build` để khởi chạy project
7. Truy cập vào `http://localhost:8000/swagger-ui/index.html` để xem tài liệu về API

### Cài đặt cho môi trường production

- Đang chờ cập nhật