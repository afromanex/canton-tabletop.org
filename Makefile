
.PHONY: help
help:
	@echo "make <target>"
	@echo "targets:"
	@echo "  preview  Start the hugo server and a browser"
	@echo "  deploy   Publish files on public site"
	@echo "  build    Build files for local check"
	@echo "  clean    Remove generated files"

.PHONY: preview
preview: clean
	(sleep 1 && xdg-open http://localhost:1313) &
	hugo --baseURL=http://localhost:1313 server

.PHONY: deploy
deploy: clean build
	rsync -avz --delete public/ $(PUBLIC_HTML)

.PHONY: build
build:
	hugo

.PHONY: clean
clean:
	rm -rf public/ resources/
