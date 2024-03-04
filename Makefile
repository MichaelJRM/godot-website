build: build-hugo index-pages

build-hugo: install-tools update-mirrorList update-download-archive
	hugo --gc --minify

serve: index-pages
	hugo server -D

serve-minify: index-pages
	hugo server -D --minify

serve-nocache: index-pages
	hugo server -D --ignoreCache --disableFastRender

serve-profile: index-pages
	hugo server --templateMetrics --templateMetricsHints

serve-no-reload: index-pages
	hugo server --disableLiveReload

install-tools:
	cd ./tools/generators && npm install

update-mirrorList:
	node ./tools/generators/src/mirror_list_generator.js

update-download-archive:
	node ./tools/generators/src/download_archive_generator.js

index-pages:
	npx --yes pagefind --site "public"
