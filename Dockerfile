FROM python:3 AS builder
RUN python3 -m venv /usr/src/app/my_env
ENV PATH="/usr/src/app/my_env/bin:$PATH"
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3 AS runner

#Copying files from the previous stage
COPY --from=builder /usr/src/app/my_env /usr/src/app/my_env
WORKDIR /usr/src/app/code
COPY . .
ENV VIRTUAL_ENV=/usr/src/app/my_env
ENV PATH="/usr/src/app/my_env/bin:$PATH"
CMD [ "python", "./hi.py" ]