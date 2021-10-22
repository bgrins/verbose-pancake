
FROM public.ecr.aws/lambda/python:3.8

COPY app.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

COPY firefox firefox
COPY geckodriver .

ENV PATH="${LAMBDA_TASK_ROOT}:${PATH}"

RUN yum update
RUN yum -y --verbose install gtk3 libXinerama.x86_64 cups-libs dbus-glib
RUN yum -y --verbose groupinstall "Development Tools"
# RUN yum -y groupinstall "Development Tools" "Development Libraries"

ENV MOZ_HEADLESS=1

CMD [ "app.handler" ]
