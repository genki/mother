build:
	docker build . | tail -n1 | sed -E "s/^Successfully built //" > CID

run: build
	docker run --rm -v /var/lib/docker/linkgraph.db:/linkgraph.db \
		-e GRAND_MOTHER=vxlan-n1 `cat CID`

tag: build
	docker tag -f `cat CID` s21g/mother:latest
	docker tag -f `cat CID` s21g/mother:`cat VERSION`

release: tag
	docker push s21g/mother:latest
	docker push s21g/mother:`cat VERSION`
