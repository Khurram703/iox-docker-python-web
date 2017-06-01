FROM python:3-alpine

RUN pip3 install bottle

EXPOSE 8000

COPY main.py /main.py

CMD python3 /main.py

LABEL "cisco.cpuarch"="x86_64"
LABEL "cisco.resources.profile"="c1.small"
LABEL "cisco.resources.network.0.ports.tcp"="9000"
