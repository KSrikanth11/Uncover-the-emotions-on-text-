# Use a base image with Java 17 installed
FROM adoptopenjdk/openjdk17:alpine-slim

# Set the working directory inside the container
WORKDIR /app/src

# Copy the Maven executable to the container image
COPY mvnw .
COPY .mvn .mvn

# Copy the project descriptor files to the container image
COPY pom.xml .

# Copy the source code to the container image
COPY src src

# Package the application
RUN ./mvnw package -DskipTests

# Expose port 8080
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/NLP.jar"]
