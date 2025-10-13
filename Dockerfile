# =========================
# Stage 1: Build the JAR
# =========================
FROM maven:3.9.3-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy Maven configuration first (to cache dependencies)
COPY pom.xml .

# Copy source code
COPY src ./src

# Build the project (skip tests to speed up)
RUN mvn clean package -DskipTests

# =========================
# Stage 2: Run the app
# =========================
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/flames-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8082

# Start the Spring Boot app
CMD ["java", "-jar", "app.jar"]
