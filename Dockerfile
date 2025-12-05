# Use official PHP image (Secure, maintained, small)
FROM php:8.2-fpm-alpine

# Install system dependencies
# SRE Tip: Clean up apt/apk cache to reduce image size
RUN apk add --no-cache \
    git \
    curl \
    libpng-dev \
    oniguruma-dev \
    libxml2-dev \
    zip \
    unzip

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application code (Standard for production builds)
COPY ./src .

# Create a non-root user (Security Best Practice)
RUN addgroup -g 1000 -S appuser && \
    adduser -u 1000 -S appuser -G appuser

# Switch to non-root user
USER appuser

# Expose port 9000 (PHP-FPM default)
EXPOSE 9000

CMD ["php-fpm"]
