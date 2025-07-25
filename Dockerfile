FROM maven:3.9.11-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package

FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY --from=build /app/target/*.war /app/root.war

ENTRYPOINT [ "java", "-jar", "/app/root.war" ]

EXPOSE 8085