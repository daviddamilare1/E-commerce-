FROM python:3.12.12-slim-bookworm

ENV PYTHONDONTWRITECODE=1
ENV PYTHONBUFFERED=1

WORKDIR /fastcart

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r reqirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]