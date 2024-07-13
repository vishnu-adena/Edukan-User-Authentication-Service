FROM maven:3.9.6-eclipse-temurin-21 AS build

COPY . .

RUN mvn clean package


FROM openjdk:21

EXPOSE 8081

COPY --from=build /target/edukanUserService-1.0.0.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]