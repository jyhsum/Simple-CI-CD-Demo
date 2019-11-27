FROM    python:3.7-alpine3.10

COPY	requirements.txt /opt
RUN	    pip3 install -r /opt/requirements.txt

RUN     mkdir -p /ci_cd_demo
WORKDIR /ci_cd_demo

COPY    ci_cd_demo ./
EXPOSE  8000

RUN     chmod +x entry.sh

ENTRYPOINT [ "./entry.sh" ]