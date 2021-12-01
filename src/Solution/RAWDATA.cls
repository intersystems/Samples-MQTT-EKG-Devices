/// Production response class. Target of data transformation
/// that converts from MQTT topic and payload into a persistent object.
Class Solution.RAWDATA Extends (%Persistent, %XML.Adaptor, Ens.Util.RequestBodyMethods)
{

Property seq As %BigInt;

Property p1 As %Integer;

Property p2 As %Integer;

Property p3 As %Integer;

Property p4 As %Integer;

Index idxseq on seq;

ClassMethod INSERT(seq, p1, p2, p3, p4) As %Status
{
    &SQL(INSERT INTO RAWDATA (seq, p1,p2,p3,p4) VALUES (:seq, :p1,:p2,:p3,:p4))
    Quit $$$OK
}

ClassMethod New(seq, p1, p2, p3, p4) As Solution.RAWDATA
{
    Set p=##class(Solution.RAWDATA).%New()
    Set p.seq=seq
    Set p.p1=p1
    Set p.p2=p2
    Set p.p3=p3
    Set p.p4=p4
    Quit p
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
<Value>seq</Value>
</Value>
<Value name="3">
<Value>p1</Value>
</Value>
<Value name="4">
<Value>p2</Value>
</Value>
<Value name="5">
<Value>p3</Value>
</Value>
<Value name="6">
<Value>p4</Value>
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
