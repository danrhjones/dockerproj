setup:
	python3 -m venv ~/.dockerproj
	
activate:
	source ~/.dockerproj/bin/activate

run-circleci-local:
	circleci local execute

validate-circleci:
	circleci config process .circleci/config.yml

install:
	pip install -r requirements.txt

test:
	python -m pytest -vv --cov=myrepolib tests/*.py
	python -m pytest --nbval notebook.ipynb

lint-docker:
	hadolint Dockerfile
	# pylint --disable=R,C,W1203,W1202 demos/**/**.py

lint:
	pylint --disable=R,C myrepolib cli web

all: install lint test
