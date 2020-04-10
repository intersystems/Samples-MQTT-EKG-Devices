Class Demo.HeartRate Extends (%Persistent, %Populate)
{

Property PatientID As %String;

Property Provider As %String(POPSPEC = "ValueList("",John,Jacob,Jinglheimer"")");

Property BPM As %Integer;

Property TimeStamp As %DateTime [ InitialExpression = {$ZDATETIME($ZTIMESTAMP)} ];

Storage Default
{
<Data name="HeartRateDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientID</Value>
</Value>
<Value name="3">
<Value>Provider</Value>
</Value>
<Value name="4">
<Value>BPM</Value>
</Value>
<Value name="5">
<Value>TimeStamp</Value>
</Value>
</Data>
<DataLocation>^Demo.HeartRateD</DataLocation>
<DefaultData>HeartRateDefaultData</DefaultData>
<IdLocation>^Demo.HeartRateD</IdLocation>
<IndexLocation>^Demo.HeartRateI</IndexLocation>
<StreamLocation>^Demo.HeartRateS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
