FROM python:alpine
LABEL maintainer="github@krushak.me"

####################
# Run APK installs #
####################
RUN apk add --update --no-cache \
    automake \
    autoconf \
    libtool \
    gcc \
    git \
    libc-dev \
    make 
    
#####################
#Get latest version #
#####################
RUN git clone https://git.savannah.gnu.org/git/chktex.git \
    && cd chktex/chktex \
    && sh autogen.sh --prefix=/usr/bin \
    && ./configure \
    && make \
    && install chktex /usr/bin
