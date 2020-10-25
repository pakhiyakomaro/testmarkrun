FROM alpine
RUN apk update
RUN add --no-cache python3 python3-pip git npm
RUN pip3 install flask flask_cors docutils
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/pakhiyakomaro/markdown-preview.git
WORKDIR /app/markdown-preview
RUN npm install
RUN npm run build
WORKDIR /app/markdown-preview/src/scripts
CMD python3 rst2html.py
