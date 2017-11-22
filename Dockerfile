FROM alpine:edge
MAINTAINER Ivo von Putzer Reibegg <ivo.putzer@gmail.com>
ENV CHROME_BIN /usr/bin/chromium-browser
RUN apk --update --no-cache add chromium
EXPOSE 9222
ENTRYPOINT ["/usr/bin/chromium-browser"]
CMD ["--headless", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222", "--disable-gpu", "--disable-sync","--disable-extensions", "--disable-translate", "--disable-background-networking", "--disable-default-apps", "--safebrowsing-disable-auto-update", "--metrics-recording-only", "--mute-audio", "--no-first-run", "--hide-scrollbars"]
