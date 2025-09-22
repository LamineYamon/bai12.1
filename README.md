# SQL Gateway with Connection Pooling - Exercise 12-1

Java web application implementing connection pooling for database operations.

## Features
- Connection pooling with JNDI DataSource
- SQL statement execution interface
- JSTL support
- Tomcat deployment ready

## Docker Deployment

### Option 1: Pre-built WAR
```bash
# Build WAR file first
ant clean war

# Build and run Docker container
docker build -t sql-gateway .
docker run -p 8080:8080 sql-gateway
```

### Option 2: Multi-stage build
```bash
docker build -f Dockerfile.multi-stage -t sql-gateway .
docker run -p 8080:8080 sql-gateway
```

## Environment Variables
- `DB_HOST`: Database host (default: localhost)
- `DB_PORT`: Database port (default: 3306)
- `DB_NAME`: Database name (default: murach)
- `DB_USER`: Database user (default: murach_user)
- `DB_PASSWORD`: Database password (default: sesame)

## Local Development
```bash
ant clean deploy
```

Access at: http://localhost:8080/