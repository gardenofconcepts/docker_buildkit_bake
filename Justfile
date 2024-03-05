export DOCKER_BUILDKIT := "1"
export BUILDKIT_PROGRESS := "plain"

set dotenv-load
set shell := ["bash", "-uc"]

go:
    docker compose build
    docker compose up --wait
    @just clear
    @just enter

enter:
    docker compose exec dind zsh

refresh:
    docker compose kill
    @just go

clear:
    #!/usr/bin/env bash
    if [ -z "${DOCKER_DIND}" ]; then
        echo "Run this command inside the dind container!"
        docker compose exec dind just clear
    else
        echo "Clearing all docker resources..."
        docker system prune -af
        docker volume prune -af
        docker buildx prune -af
        docker builder prune -af
        docker builder rm bob || true
        docker builder create --use --bootstrap --driver docker-container --name bob
        docker login registry.gitlab.com -u dennisoehme --password-stdin <<<${GITLAB_PAT}
    fi
