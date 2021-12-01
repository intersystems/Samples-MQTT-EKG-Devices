/// Production response class. Target of data transformation
/// that converts from MQTT topic and payload into a persistent object.
Class Solution.MQTTDATA Extends (%Persistent, %XML.Adaptor, Ens.Util.RequestBodyMethods)
{

Property topic As %String;

Property seq As %BigInt;

Property values As %String(MAXLEN = 100000);

Index idxseq On seq;

Method %OnNew(topic As %String, seq As %BigInt, values As %String) As %Status [ Private, ServerOnly = 1 ]
{
    Set ..topic=topic
    Set ..seq=seq
    Set ..values=values
    Return $$$OK
}

ClassMethod GETNEWID() As %Integer
{
    Quit $INCREMENT(^MQTTDATAUNIQ)
}

}
