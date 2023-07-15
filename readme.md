https://medium.com/@roshanalex/speeding-up-docker-builds-in-ci-18cc9740b3af

docker build \
	--target builder \
	--cache-from myapp:builder \
	--build-arg BUILDKIT_INLINE_CACHE=1 \
	--tag myapp:builder .
docker push myapp:builder

docker build \
	--cache-from myapp:builder \
	--cache-from myapp:runner \
	--build-arg BUILDKIT_INLINE_CACHE=1 \
	--tag myapp:runner .
docker push myapp:runner