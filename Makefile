install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=main --cov=calCLI --cov=mylib test_*.py

format:
	#black *.py mylib/*.py

lint:
	#pylint --disable=R,C --extention-pkg-whitelist='pydantic' W1203 main.py --ignore-patterns=test_.*?.py calCLI.py mylib/*.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#./deploy.sh

all: install lint test format deploy
