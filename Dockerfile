FROM store/intersystems/irishealth-community:2020.1.0.215.0

USER root

RUN mkdir /opt/app && chown irisowner:irisowner /opt/app



WORKDIR /opt/app

COPY irissession.sh /
RUN chmod +x /irissession.sh 

USER irisowner
COPY ./Setup.cls ./
COPY ./src ./src/
COPY ./Installer.cls ./
SHELL ["/irissession.sh"]



RUN \
    do $system.OBJ.Load("/opt/app/Installer.cls", "ck") \
    set sc = ##class(App.Installer).Initialize() 
# bringing the standard shell back
SHELL ["/bin/bash", "-c"]

CMD [ "-l", "/usr/irissys/mgr/messages.log" ]
