FROM python:3.13-slim
WORKDIR /app/rag
# copies frontend folder from host into /app/rag/frontend in container
COPY frontend frontend
# this makes the package structure intact -> will see the rag folder
ENV PYTHONPATH=/app
# install uv on the container
RUN pip install --no-cache-dir uv
WORKDIR /app/rag/frontend
# this installs the dependencies specified in pyproject.toml into a .venv
RUN uv sync --no-dev
EXPOSE 8501
CMD [ "uv", "run", "streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.port=8501" ]