FROM python:3.12-slim

WORKDIR /app
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt
RUN groupadd --system app && useradd --system --gid app --no-create-home app
COPY app.py .

USER app
EXPOSE 5000
CMD ["python", "app.py"]
