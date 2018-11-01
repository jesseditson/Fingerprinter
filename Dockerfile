FROM debian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie main non-free contrib\n\
deb-src http://ftp.debian.org/debian jessie main non-free contrib\n\
deb http://ftp.debian.org/debian jessie-updates main contrib non-free\n\
deb-src http://ftp.debian.org/debian jessie-updates main contrib non-free\n" >> /etc/apt/sources.list

RUN cat /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install cmake -y
RUN apt-get install build-essential -y
RUN apt-get install libtag1c2a -y
RUN apt-get install fftw3-dev -y
RUN apt-get install libtagc0-dev -y
RUN apt-get install libcurl3 -y
RUN apt-get install libcurl3-dev -y
RUN apt-get install libmad0-dev -y
RUN apt-get install libsamplerate0-dev -y
RUN apt-get install debhelper -y

RUN mkdir /src
COPY . /src
WORKDIR /src/
RUN cmake .
RUN make
RUN dpkg-buildpackage
CMD echo "Successfully built. Run 'docker run Fingerprinter lastfm-fpclient <file.mp3>'"