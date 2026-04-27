# RAG-mlops25

## Note on overal structure

- want single .venv for the whole project
- one pyproject.toml for the whole project
- one pyproject.toml for backend
- one pyproject.toml for frontend

Reason for this:

- we will dockerize into two services (backend, frontend)
- inside each service/container - want to do `uv sync`
- some packages are only used in one service and not the other
