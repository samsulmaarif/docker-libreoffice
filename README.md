# LibreOffice on Docker

[LibreOffice](https://www.libreoffice.org/discover/libreoffice/) is a powerful office suite – its clean interface and feature-rich tools help you unleash your creativity and enhance your productivity. LibreOffice includes several applications that make it the most powerful Free and Open Source office suite on the market: Writer (word processing), Calc (spreadsheets), Impress (presentations), Draw (vector graphics and flowcharts), Base (databases), and Math (formula editing).

This is unofficial build of LibreOffice 6.0.1 running within a docker container and rendered by the local X Server.

## Changelog

```
v1.9
* Update image to LibreOffice 6.0.2

v1.8
* Update image to LibreOffice 6.0.1

v1.7
* Update base image to Ubuntu 16.04
* Update image to LibreOffice 6.0.0

v1.6
* Updated image to LibreOffice 5.3.4.

v1.5
* Updated image to LibreOffice 5.1.0.

v1.4
* Updated image to LibreOffice 5.0.4.

v1.3
* Updated image to LibreOffice 5.0.1.

v1.2
* Updated image to LibreOffice 5.

v1.1
* Updated image to LibreOffice 4.2.8

v1.0
* User permissions now correlate between host and container. This allows
  LibreOffice documents to be saved back to the host system by passing in the
  local users uid/gid as environment variables.
```

## Pull from Docker Registry

```
docker pull samsulmaarif/docker-libreoffice
```


## Launch Command

```
docker run  -v $HOME/Documents:/home/libreoffice/Documents:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e uid=$(id -u) \
            -e gid=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
            --name libreoffice \
            samsulmaarif/docker-libreoffice
```

## FAQ

Note: If you receive the following Gtk error:

```
Gtk-WARNING **: cannot open display: unix:0.0
```

Simply allow the docker user to communicate with your X session

```
xhost +local:docker
```

## Author

- [Chris Dais](https://github.com/chrisdaish)
- [Samsul Ma'arif](https://github.com/samsulmaarif)
