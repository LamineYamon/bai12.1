# Simple Dockerfile - copy webapp directly
FROM tomcat:9.0-jdk11-openjdk

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Create webapp directory structure
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Copy web resources
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Copy and compile Java sources
COPY src/java/ /tmp/src/
RUN javac -cp "/usr/local/tomcat/lib/*" \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/ \
    /tmp/src/murach/data/*.java \
    /tmp/src/murach/sql/*.java && \
    rm -rf /tmp/src/

# Set environment variables for database connection
ENV DB_HOST=localhost \
    DB_PORT=3306 \
    DB_NAME=murach \
    DB_USER=murach_user \
    DB_PASSWORD=sesame

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

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