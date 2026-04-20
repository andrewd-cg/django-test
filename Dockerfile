FROM cgr.dev/andrewd.dev/python:3.14-dev

ARG HTTP_PROXY
ARG HTTPS_PROXY

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app
ENV PATH="/home/nonroot/.local/bin:$PATH"

WORKDIR /app

COPY --chown=65532:65532 requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=65532:65532 manage.py /app/
COPY --chown=65532:65532 myproject/ /app/myproject/
COPY --chown=65532:65532 home/ /app/home/
COPY --chown=65532:65532 templates/ /app/templates/

EXPOSE 8000

CMD ["-m", "gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
