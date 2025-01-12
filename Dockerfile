# Build stage
FROM maven:3.8.3-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mkdir -p /app/ssl && \
    openssl pkcs12 -export \
    -in /app/ssl/ssl.crt \
    -inkey /app/ssl/ssl.key \
    -out /app/ssl/keystore.p12 \
    -name ${SSL_ALIAS:-lietsi} \
    -password pass:${SSL_PASSWORD:-changeit}
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/weblietsi-backend-0.0.1-SNAPSHOT.jar app.jar
COPY --from=build /app/ssl/keystore.p12 /app/ssl/keystore.p12
EXPOSE 8080 8443
ENTRYPOINT ["java", \
            "-Dserver.ssl.key-store=/app/ssl/keystore.p12", \
            "-Dserver.ssl.key-store-password=${SSL_PASSWORD:-changeit}", \
            "-Dserver.ssl.key-alias=${SSL_ALIAS:-lietsi}", \
            "-jar","app.jar"]