FROM ubuntu:14.04

RUN apt-get update

RUN apt-get install -y build-essential autoconf bison

RUN apt-get install -y libxml2 libxml2-dev

RUN apt-get install -y wget
RUN apt-get install -y curl

RUN apt-get install -y libcurl4-gnutls-dev
RUN apt-get install -y libyaml-dev

WORKDIR /usr/local/src/

RUN wget http://jp2.php.net/get/php-7.0.9.tar.bz2/from/this/mirror
RUN mv mirror php-7.0.9.tar.bz2
RUN tar -jxvf php-7.0.9.tar.bz2

RUN wget http://pecl.php.net/get/pthreads-3.1.6.tgz
RUN tar xfvz pthreads-3.1.6.tgz
RUN mv pthreads-3.1.6 php-7.0.9/ext/pthreads

RUN wget http://pecl.php.net/get/yaml-2.0.0.tgz
RUN tar xfvz yaml-2.0.0.tgz
RUN mv yaml-2.0.0 php-7.0.9/ext/yaml

WORKDIR /usr/local/src/php-7.0.9
RUN ./buildconf --force
RUN ./configure \
--enable-debug \
--enable-maintainer-zts \
--enable-pthreads \
--enable-mbstring \
--enable-sockets \
--prefix=/usr \
--with-config-file-path=/etc \
--with-curl \
--enable-zip \
--with-zlib \
--with-yaml \
--enable-bcmath

RUN make
RUN make install

VOLUME ["/data"]
WORKDIR /data

EXPOSE 19132
# CMD [ "./start.sh" ]
