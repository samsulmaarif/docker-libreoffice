FROM ubuntu:16.04

MAINTAINER Samsul Ma'arif <mail@samsul.web.id>

ENV DEBIAN_FRONTEND noninteractive
ENV LOVERSION 6.0.2
ENV REV 1


RUN useradd -m libreoffice; \
    apt-get update \
    && apt-get install -y --no-install-recommends wget \
                                                  libdbus-glib-1-2 \
                                                  libsm6 \
                                                  openjdk-8-jre \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*

ENV LIBREOFFICEPACKAGE LibreOffice_"$LOVERSION"_Linux_x86-64_deb.tar.gz
ENV LIBREOFFICEDIR LibreOffice_"$LOVERSION"."$REV"_Linux_x86-64_deb

WORKDIR /tmp

RUN wget -c http://download.documentfoundation.org/libreoffice/stable/$LOVERSION/deb/x86_64/LibreOffice_"$LOVERSION"_Linux_x86-64_deb.tar.gz -O /tmp/$LIBREOFFICEPACKAGE
RUN mkdir /tmp/LibreOffice \
    && tar -xzf /tmp/$LIBREOFFICEPACKAGE -C /tmp/LibreOffice \
    && dpkg -i /tmp/LibreOffice/$LIBREOFFICEDIR/DEBS/*.deb \
    && rm -f /tmp/$LIBREOFFICEPACKAGE \
    && rm -rf /tmp/LibreOffice

COPY start-libreoffice.sh /

ENTRYPOINT ["/start-libreoffice.sh"]
