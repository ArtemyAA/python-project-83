PORT ?= 8000

install:
	poetry install

pack-install:
	poetry install	
	poetry build
	poetry publish --dry-run
	python3 -m pip install --user dist/*.whl --force-reinstall

dev:
	poetry run flask --app page_analyzer:app run

start:
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

local-start:
	poetry run gunicorn -w 5 -b 127.0.0.1:$(PORT) page_analyzer:app

lint:
	poetry run flake8 page_analyzer

build:
	./build.sh