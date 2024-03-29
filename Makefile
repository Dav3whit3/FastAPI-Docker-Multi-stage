#!make
include .env

local:
	clear
	uvicorn src.app:app --reload --host ${BACKEND_HOST} --port ${PORT}

prod:
	clear
	docker-compose stop
	docker-compose down --remove-orphans
	docker-compose up api-prod

dev:
	clear
	docker-compose stop
	docker-compose down --remove-orphans
	docker-compose up api-dev

docker-fresh-prod:
	clear
	$(info 🔰 Environment: PRODUCTION )
	docker system prune -a -f
	docker network prune -f
	docker-compose stop
	docker-compose down --remove-orphans
	docker-compose up api-prod --build

docker-fresh-dev:
	clear
	$(info 🔰 Environment: Development 🔰)
	docker system prune -a -f
	docker network prune -f
	docker-compose stop
	docker-compose down --remove-orphans
	docker-compose up api-dev --build

deploy:
	clear
	$(info ⏫  Pushing to Railway ⏫ )
	git add .
	git commit --allow-empty -m "Deploy"
	git push

tidy:
	clear
	pip list --format="freeze" > requirements.txt

migrate:
	clear
	aerich migrate

clean: SHELL:=/bin/bash
clean:
	find . | grep -E "(/__pycache__$|\.pyc$|\.pyo$)" | xargs rm -rf