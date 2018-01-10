FROM ubuntu:16.04

MAINTAINER Samsul Ma'arif <mail@samsul.web.id>

ENV DEBIAN_FRONTEND noninteractive
ENV LOVERSION 6.0.0


RUN useradd -m libreoffice; \
    apt-get update \
    && apt-get install -y --no-install-recommends wget \
                                                  libdbus-glib-1-2 \
                                                  libsm6 \
                                                  openjdk-8-jre \
    && rm -rf /var/lib/apt/lists/*

ENV LIBREOFFICEPACKAGE LibreOffice_$LOVERSION_Linux_x86-64_deb.tar.gz
ENV LIBREOFFICEDIR LibreOffice_$LOVERSION.1_Linux_x86-64_deb

RUN wget -q http://kambing.ui.ac.id/tdf/libreoffice/testing/$LOVERSION/deb/x86_64/LibreOffice_$LOVERSION.1_Linux_x86-64_deb.tar.gz -O /tmp/$LIBREOFFICEPACKAGE \
    && mkdir /tmp/LibreOffice \
    && tar -xzf /tmp/$LIBREOFFICEPACKAGE -C /tmp/LibreOffice \
    && dpkg -i /tmp/LibreOffice/$LIBREOFFICEDIR/DEBS/*.deb \
    && rm -f /tmp/$LIBREOFFICEPACKAGE \
    && rm -rf /tmp/LibreOffice

COPY start-libreoffice.sh /

ENTRYPOINT ["/start-libreoffice.sh"]
