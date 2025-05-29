# syntax=docker/dockerfile:1
FROM registry.gitlab.com/islandoftex/images/texlive:TL2023-2023-08-13-full

# install dependencies
RUN apt update && apt install -y wget

# get adobe source han serif fonts super OTC pack from https://github.com/adobe-fonts/source-han-serif/tree/release#downloading-source-han-serif
RUN mkdir fonts
WORKDIR /fonts
RUN wget https://github.com/adobe-fonts/source-han-serif/releases/download/2.003R/01_SourceHanSerif.ttc.zip
RUN unzip 01_SourceHanSerif.ttc.zip
RUN cp SourceHanSerif.ttc /usr/local/share/fonts/
RUN fc-cache

WORKDIR /workdir
