build:
	hugo --gc --minify

serve:
	hugo server -D

serve-minify:
	hugo server -D --minify

install-tools:
	cd ./tools/generators && npm install

update-mirrorList:
	node ./tools/generators/src/mirror_list_generator.js

update-download-archive:
	node ./tools/generators/src/download_archive_generator.js