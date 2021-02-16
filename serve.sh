#!/usr/bin/env bash
JEKYLL_VERSION=4.2.0
docker container rm myblog
docker run --name myblog --volume="$PWD:/srv/jekyll" -p 4000:4000 -it jekyll/jekyll:$JEKYLL_VERSION jekyll serve --watch --drafts