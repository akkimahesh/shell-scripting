# Use a base image with Java installed
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the packaged JAR file into the container
COPY target/your-application.jar /app/TrainBook-1.0.0-SNAPSHOT.war

# Expose the port your application listens on (if applicable, e.g., for a web app)
EXPOSE 8080

# Define the command to run your application when the container starts
ENTRYPOINT ["java", "-war", "TrainBook-1.0.0-SNAPSHOT.war"]