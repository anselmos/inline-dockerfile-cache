# Inline Dockerfile Caching

If you don't already know, there is no feature like "RUN NOCACHE" or "ALWAYS" as you can check in [this feature request on github](https://github.com/moby/moby/issues/1996)

And there I've found 2 beautiful workarounds that works like a charm!

Example 1:

```docker

thaJeztah commented on 18 Jan 2016
@c9s try this instead

FROM foo
ARG CACHE_DATE=2016-01-01
RUN git clone ...
docker build --build-arg CACHE_DATE=$(date) ....
```

Example 2:

```docker

CheRuisiBesares commented on 6 Aug 2014
So I was struggling with this issue for a while and I just wanted to share my work around incase its helpful while this gets sorted out. I really didn't want to add anything outside of the docker file to the build invocation or change the file every time. Anyway this is a silly example but it uses the add mechanism to bust the cache and doesn't require any file manipulations.

From ubuntu:14.04

RUN apt-get -yqq update
RUN apt-get -yqq install git
RUN git clone https://github.com/coreos/fleet
ADD http://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new uuid
RUN cd fleet && git pull
Obviously you can pick your own use case and network random gen. Anyway maybe it will help some people out idk.
```
