Class Solution.HeartRate Extends (Ens.Response, %Populate)
{

Property PatientID As %String;

Property BPM As %Integer;

Property TimeStamp As %DateTime [ InitialExpression = {$ZDATETIME($ZTIMESTAMP)} ];

Storage Default
{
<Data name="HeartRateDefaultData">
<Subscript>"HeartRate"</Subscript>
<Value name="1">
<Value>PatientID</Value>
</Value>
<Value name="2">
<Value>Provider</Value>
</Value>
<Value name="3">
<Value>BPM</Value>
</Value>
<Value name="4">
<Value>TimeStamp</Value>
</Value>
</Data>
<DefaultData>HeartRateDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
