FROM store/intersystems/irishealth-community:2020.1.0.215.0

USER root

RUN mkdir /opt/app && chown irisowner:irisowner /opt/app



WORKDIR /opt/app



COPY ./Setup.cls ./
COPY irissession.sh /
RUN chmod +x /irissession.sh

USER irisowner
COPY ./src ./src/
COPY ./Installer.cls ./
SHELL ["/irissession.sh"]



RUN \
    Do $system.OBJ.Load("/opt/app/Setup.cls", "ck") \
    set sc = ##class(Setup.Init).Initialize()

CMD [ "-l", "/usr/irissys/mgr/messages.log" ]
