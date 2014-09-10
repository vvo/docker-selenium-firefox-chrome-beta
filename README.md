docker-selenium-firefox-chrome-beta
===================================

A Dockerfile starting a selenium standalone server with Chrome and Firefox beta.

This Dockerfile si providing a standalone selenium server.

Running:

```shell
docker pull vvoyer/docker-selenium-firefox-chrome
docker run --privileged -p 4444:4444 -p 5999:5999 -d vvoyer/docker-selenium-firefox-chrome
```

Selenium now running on your host: `localhost:4444`.
You also have a VNC server listening on your host to your container: `localhost:5999`.
