FROM python:3.8.8
# Select Working Directory
WORKDIR /app

COPY build/Pipfile ./

# Copy the requirements file
COPY build/requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

RUN pip install --no-cache-dir pipenv && pipenv install

COPY app/ .

CMD [ "python", "app.py" ]
