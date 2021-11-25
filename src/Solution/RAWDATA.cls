/// Production response class. Target of data transformation
/// that converts from MQTT topic and payload into a persistent object.
Class Solution.RAWDATA Extends %Persistent
{

Property seq As %BigInt;

Property p1 As %Integer;

Property p2 As %Integer;

Property p3 As %Integer;

ClassMethod INSERT(seq, p1, p2, p3) As %Status
{
    &SQL(INSERT INTO RAWDATA (seq, p1,p2,p3) VALUES (:seq, :p1,:p2,:p3))
    Quit $$$OK
}

ClassMethod GETNEWID() As %Integer
{
    Quit $INCREMENT(^RAWDATAUNIQ)
}

Storage Default
{
<Data name="RAWDATADefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>p1</Value>
</Value>
<Value name="3">
<Value>p2</Value>
</Value>
<Value name="4">
<Value>p3</Value>
</Value>
<Value name="5">
<Value>uid</Value>
</Value>
</Data>
<DataLocation>^Solution.RAWDATAD</DataLocation>
<DefaultData>RAWDATADefaultData</DefaultData>
<IdLocation>^Solution.RAWDATAD</IdLocation>
<IndexLocation>^Solution.RAWDATAI</IndexLocation>
<StreamLocation>^Solution.RAWDATAS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
