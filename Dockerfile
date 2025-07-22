# Use nginx as the base image
FROM nginx:alpine

# Install packages (e.g., curl and bash) — use apk for Alpine
RUN apk update && apk add --no-cache bash curl

# Create custom directories or use existing ones (e.g., /opt)
RUN mkdir -p /opt/amitstuff

# Copy index.html to web root (already being done)
COPY index.html /usr/share/nginx/html/index.html

# Add additional files to /opt/amitstuff or other directories
COPY dummy.txt /opt/amitstuff/

