# Demo image for Cycode container scanning.
# Built from this repo's own code, so a fix merged here (for example a
# pom.xml upgrade) reaches the image on the next build.

# Stage 1: compile the app from source
FROM maven:3.9-eclipse-temurin-8 AS build
WORKDIR /src
COPY pom.xml .
COPY src ./src
RUN mvn -q -B -DskipTests package

# Stage 2: the image that runs
FROM eclipse-temurin:8-jre
LABEL org.opencontainers.image.source="https://github.com/ali-cycode-demo/java-sec-code"
LABEL org.opencontainers.image.description="java-sec-code demo app (deliberately vulnerable)"
WORKDIR /app
COPY --from=build /src/target/java-sec-code-1.0.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
