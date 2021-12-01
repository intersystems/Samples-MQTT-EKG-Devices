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

Storage Default
{
<Data name="MQTTDATADefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>topic</Value>
</Value>
<Value name="3">
<Value>seq</Value>
</Value>
<Value name="4">
<Value>values</Value>
</Value>
</Data>
<DataLocation>^Solution.MQTTDATAD</DataLocation>
<DefaultData>MQTTDATADefaultData</DefaultData>
<IdLocation>^Solution.MQTTDATAD</IdLocation>
<IndexLocation>^Solution.MQTTDATAI</IndexLocation>
<StreamLocation>^Solution.MQTTDATAS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
