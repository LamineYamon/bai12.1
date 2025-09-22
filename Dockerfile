# Multi-stage build
FROM maven:3.8.4-openjdk-11 AS build

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Install Ant and build the WAR file
RUN apt-get update && apt-get install -y ant && \
    ant clean war

# Runtime stage
FROM tomcat:9.0-jdk11-openjdk

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from build stage
COPY --from=build /app/build/ch12_ex1_sqlGateway.war /usr/local/tomcat/webapps/ROOT.war

# Set environment variables for database connection
ENV DB_HOST=localhost
ENV DB_PORT=3306
ENV DB_NAME=murach
ENV DB_USER=murach_user
ENV DB_PASSWORD=sesame

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]