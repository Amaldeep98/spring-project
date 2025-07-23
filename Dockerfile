FROM maven:3.9.11-eclipse-temurin-17 as build

WORKDIR /app

COPY . .

RUN mvn clean package

FROM build

WORKDIR /app

COPY --from=build /app/target/*.war /app/root.war

ENTRYPOINT [ "java", "-jar", "/app/root.war" ]

EXPOSE 8085