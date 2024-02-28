build: install-tools update-mirrorList update-download-archive
	hugo --gc --minify

serve:
	hugo server -D

serve-minify:
	hugo server -D --minify

serve-nocache:
	hugo server -D --ignoreCache --disableFastRender

serve-profile:
	hugo server --templateMetrics --templateMetricsHints

install-tools:
	cd ./tools/generators && npm install

update-mirrorList:
	node ./tools/generators/src/mirror_list_generator.js

update-download-archive:
	node ./tools/generators/src/download_archive_generator.js
