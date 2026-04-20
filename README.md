# Python Sample App

A simple Django app running on a Chainguard Python image.

## Stack

- Python 3.14 (Chainguard image)
- Django 4.2
- Gunicorn

## Build and Run

```bash
docker build -t python-sample-app .
docker run -p 8000:8000 python-sample-app
```

Visit `http://localhost:8000`.
