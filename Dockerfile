FROM 3.8.3-openjdk-17
WORKDIR /app
COPY ./target/TayeOlaProject-1.0-SNAPHOT.jar /app/
CMD ["java", "-jar",  "/target/TayeOlaProject-1.0-SNAPHOT.jar"]
