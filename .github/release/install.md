## Install

### Homebrew (macOS and Linux)
```
brew install windix/tap/vcs
```

### Linux from source (Debian / Ubuntu)
```sh
sudo apt install ffmpeg imagemagick fonts-dejavu-core make xsltproc docbook-xsl docbook-xml
curl -fsSL https://github.com/@REPOSITORY@/archive/refs/tags/v@VERSION@.tar.gz | tar xz
cd video-contact-sheet-@VERSION@/dist
make -C docs vcs.1 vcs.conf.5   # generate the man pages
sudo make install               # installs to /usr/local (use prefix=... to change)
```
Uninstall with `sudo make uninstall` from the same directory.

### Other Linux distributions
Requirements: Bash, GNU `getopt` (util-linux, present on most distributions), FFmpeg (with `ffprobe`) and ImageMagick 6 or 7. DejaVu Sans is the default font.
Building the man pages also needs `xsltproc`, the DocBook XSL stylesheets and the DocBook 4.5 DTD; if your distribution keeps the stylesheets elsewhere, pass their location, e.g. `make -C docs vcs.1 vcs.conf.5 DOCBOOK_XSL=/usr/share/sgml/docbook/xsl-stylesheets`.
If you only need the program, `dist/vcs` is a standalone script: copy it anywhere on your `PATH`.
