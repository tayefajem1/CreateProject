FROM openjdk:17-jdk-slim
WORKDIR /app
COPY ./target/TayeOlaProject-1.0-SNAPSHOT.jar /app/
CMD ["java", "-jar", "TayeOlaProject-1.0-SNAPSHOT.jar"]

