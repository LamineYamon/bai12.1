# Use Tomcat 9 with OpenJDK 11
FROM tomcat:9.0-jdk11-openjdk

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to webapps directory
COPY build/ch12_ex1_sqlGateway.war /usr/local/tomcat/webapps/ROOT.war

# Copy MySQL connector to Tomcat lib (if needed)
# COPY mysql-connector-java-8.0.33.jar /usr/local/tomcat/lib/

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