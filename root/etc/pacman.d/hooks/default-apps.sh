#! /usr/bin/env sh


sed -i \
    -e "/application\/pdf/s/.*/application\/pdf=org.pwmt.zathura-pdf-mupdf.desktop;/" \
    -e "/image\/bmp/s/.*/image\/bmp=sxiv.desktop;/" \
    -e "/image\/gif/s/.*/image\/gif=sxiv.desktop;/" \
    -e "/image\/jpeg/s/.*/image\/jpeg=sxiv.desktop;/" \
    -e "/image\/jpg/s/.*/image\/jpg=sxiv.desktop;/" \
    -e "/image\/png/s/.*/image\/png=sxiv.desktop;/" \
    -e "/image\/tiff/s/.*/image\/tiff=sxiv.desktop;/" \
    -e "/image\/x-bmp/s/.*/image\/x-bmp=sxiv.desktop;/" \
    -e "/image\/x-portable-anymap/s/.*/image\/x-portable-anymap=sxiv.desktop;/" \
    -e "/image\/x-portable-bitmap/s/.*/image\/x-portable-bitmap=sxiv.desktop;/" \
    -e "/image\/x-portable-graymap/s/.*/image\/x-portable-graymap=sxiv.desktop;/" \
    -e "/image\/x-tga/s/.*/image\/x-tga=sxiv.desktop;/" \
    -e "/image\/x-xpixmap/s/.*/image\/x-xpixmap=sxiv.desktop;/" \
    -e "/text\/english/s/.*/text\/english=vim.desktop;/" \
    -e "/text\/html/s/.*/text\/html=vim.desktop;/" \
    -e "/text\/plain/s/.*/text\/plain=vim.desktop;/" \
    -e "/text\/x-c/s/.*/text\/x-c=vim.desktop;/" \
    -e "/text\/x-c++/s/.*/text\/x-c++=vim.desktop;/" \
    -e "/text\/x-c++hdr/s/.*/text\/x-c++hdr=vim.desktop;/" \
    -e "/text\/x-c++src/s/.*/text\/x-c++src=vim.desktop;/" \
    -e "/text\/x-chdr/s/.*/text\/x-chdr=vim.desktop;/" \
    -e "/text\/x-csrc/s/.*/text\/x-csrc=vim.desktop;/" \
    -e "/text\/x-csv/s/.*/text\/x-csv=vim.desktop;/" \
    -e "/text\/x-google-video-pointer/s/.*/text\/x-google-video-pointer=vim.desktop;/" \
    -e "/text\/x-java/s/.*/text\/x-java=vim.desktop;/" \
    -e "/text\/x-makefile/s/.*/text\/x-makefile=vim.desktop;/" \
    -e "/text\/x-moc/s/.*/text\/x-moc=vim.desktop;/" \
    -e "/text\/x-pascal/s/.*/text\/x-pascal=vim.desktop;/" \
    -e "/text\/x-tcl/s/.*/text\/x-tcl=vim.desktop;/" \
    -e "/text\/x-tex/s/.*/text\/x-tex=vim.desktop;/" \
    -e "/text\/xml/s/.*/text\/xml=vim.desktop;/" \
    -e "/x-scheme-handler\/http/s/.*/x-scheme-handler\/http=org.qutebrowser.qutebrowser.desktop;/" \
    -e "/x-scheme-handler\/https/s/.*/x-scheme-handler\/https=org.qutebrowser.qutebrowser.desktop;/" \
    /usr/share/applications/mimeinfo.cache

