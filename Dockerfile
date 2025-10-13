# Use an official OpenJDK runtime as a parent image
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the built jar file into the container
# Make sure your jar is in the target/ folder, e.g., target/flames-0.0.1-SNAPSHOT.jar
COPY target/flames-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8082

# Run the jar file
ENTRYPOINT ["java","-jar","app.jar"]
