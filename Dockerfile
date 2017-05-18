FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y python-pip

## This is also a working solution, but this will force to always cache after this line next docker layers of this image.
# ADD http://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new uuid

## Argument CACHE_DATE seems like a cleaner solution - 
## you can then use CACHE_DATE=$(date +%s) and it will force to always cache as above example, but you can also change to specific date.
ARG CACHE_DATE=2017-05-07

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
