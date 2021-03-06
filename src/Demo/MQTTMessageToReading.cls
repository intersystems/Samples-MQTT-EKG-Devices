///  Data transformation class. Should be viewed in the management portal DTL builder interface.
Class Demo.MQTTMessageToReading Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.MQTT.Message, Demo.HeartRate) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.MQTT.Message' targetClass='Demo.HeartRate' create='new' language='objectscript' >
<assign value='..Piece(source.Topic,"/","*")' property='target.PatientID' action='set' />
<assign value='source.StringValue' property='target.BPM' action='set' />
</transform>
}

}
