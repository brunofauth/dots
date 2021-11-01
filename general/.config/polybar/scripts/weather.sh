#! /bin/sh


# sed is used to remove \uFE0F
curl -sS 'wttr.in/?format=1' | sed 's|️||'

