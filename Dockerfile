ARG IMAGE=store/intersystems/irishealth-community

USER root

RUN mkdir /opt/irisbuild && chown irisowner:irisowner /opt/irisbuild

WORKDIR /opt/irisbuild




USER irisowner
COPY ./src ./src/
COPY ./Installer.cls ./
COPY iris.script iris.script


RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly

