build:
	docker build -t anselmos/inline-dockerfile-cache

rebuild-inlinecache-file:
	docker build -f DockerfileAddFile -t anselmos/inline-dockerfile-cache:file .

rebuild-inlinecache-random:
	docker build --build-arg CACHE_DATE=$(date +%s) -t anselmos/inline-dockerfile-cache:random .

rebuild-inlinecache-specific-date:
	docker build --build-arg CACHE_DATE=2017-05-05 -t anselmos/inline-dockerfile-cache:2017-05-05 .
