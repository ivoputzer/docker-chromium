docker-chromium
===
utility container for chromium headless based on [linux alpine](https://alpinelinux.org/).
by default the container will run in remote debugging mode,
which means that the chromium instance will load abount:blank waiting for instructions via:
- [devtools protocol](https://chromedevtools.github.io/devtools-protocol/)
- [puppeteer](https://github.com/GoogleChrome/puppeteer)
- [chrome-remote-interface](https://github.com/cyrus-and/chrome-remote-interface)

### build image
```sh
docker build -t chromium .
```

### pull image
```sh
docker pull ivoputzer/chromium:latest
```

### add alias to your shell profile
```sh
alias chromium="docker run --rm --privileged -p 9222:9222 -i ivoputzer/chromium $@"
```

### add alias to your fish config
```fish
alias chromium="docker run --rm --privileged -p 9222:9222 -i ivoputzer/chromium $argv"
```

### Example Usage (using the full command)

```sh
chromium # defaults to about:blank url with remote devtools listening on 0.0.0.0:9222
chromium --headless --disable-gpu --dump-dom https://www.chromestatus.com/
chromium --headless --disable-gpu --print-to-pdf https://www.chromestatus.com/
chromium --headless --disable-gpu --screenshot https://www.chromestatus.com/
chromium --headless --disable-gpu --screenshot --window-size=1280,1696 https://www.chromestatus.com/
```

flags can be added to your alias function in order to have less verbose commands:

```sh
alias chromium="docker run --rm --privileged -p 9222:9222 -i ivoputzer/chromium $@ --headless --disable-gpu" # bash
alias chromium="docker run --rm --privileged -p 9222:9222 -i ivoputzer/chromium $argv --headless --disable-gpu" #fish
chromium --dump-dom https://www.chromestatus.com/
chromium --print-to-pdf https://www.chromestatus.com/
chromium --screenshot https://www.chromestatus.com/
chromium --screenshot --window-size=1280,1696 https://www.chromestatus.com/
```

### Notes
chromium needs specific docker flags to be set:
- either `--cap-add SYS_ADMIN` to grant system administration privileges only or `--privileged` to grant extended privileges to this container.
- depending on your needs you might need to set `--security-opt seccomp=chromium.json` (the file is available within the repository).
