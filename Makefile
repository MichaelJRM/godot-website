build: build-hugo index-articles

build-hugo: install-tools update-mirrorList update-download-archive
	hugo --gc --minify

serve: index-articles
	hugo server -D

serve-minify: index-articles
	hugo server -D --minify

serve-nocache: index-articles
	hugo server -D --ignoreCache --disableFastRender

serve-profile: index-articles
	hugo server --templateMetrics --templateMetricsHints

serve-no-reload: index-articles
	hugo server --disableLiveReload

install-tools:
	cd ./tools/generators && npm install

update-mirrorList:
	node ./tools/generators/src/mirror_list_generator.js

update-download-archive:
	node ./tools/generators/src/download_archive_generator.js

index-articles:
	npx --yes pagefind --site "public" --glob "**/article/*/*.{html}"
