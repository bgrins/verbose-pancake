
Unzip firefox-93.0.tar.bz2 to "firefox" folder

docker build --platform linux/x86_64 -t hello-lambda . && docker run --shm-size 2g --platform linux/x86_64 -p 9000:8080 hello-lambda

Then either:

curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'

Or inside the container:

./firefox/firefox

Leads to:

