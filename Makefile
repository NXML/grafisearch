.PHONY: build
build:
	pnpm run build
	go build

.PHONY: dev
dev:
	gow run .

.PHONY: frontdev
frontdev:
	pnpm run dev

.PHONY: build-image
build-image:
	docker build -t grafisearch:latest ./

.PHONY: run-image
run-image:
	docker run -p 8042:8042 grafisearch:latest