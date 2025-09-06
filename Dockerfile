FROM python:3.9-slim

# Upgrade pip and setuptools FIRST, before installing other dependencies
RUN pip install --upgrade pip setuptools>=78.1.1

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

ENV FLASK_APP=app.py

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=80"]