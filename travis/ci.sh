#!/usr/bin/env sh
wget http://uk1.php.net/get/php-5.5.5.tar.bz2/from/this/mirror -O "php-5.5.5.tar.bz2"
tar -xf php-5.5.5.tar.bz2
cd php-5.5.5
cd ext
git clone https://github.com/krakjoe/pthreads.git
cd ../
./buildconf --force
./configure --disable-all --enable-pthreads --enable-maintainer-zts
make
TEST_PHP_EXECUTABLE=sapi/cli/php sapi/cli/php run-tests.php ext/pthreads
