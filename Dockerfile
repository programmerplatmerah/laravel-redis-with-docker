FROM dunglas/frankenphp
 
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

WORKDIR /app

COPY . /app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN cd /app && composer install --optimize-autoloader --no-dev

ENTRYPOINT ["php", "artisan", "octane:frankenphp", "--workers=8"]