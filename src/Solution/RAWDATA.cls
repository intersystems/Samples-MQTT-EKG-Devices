/// Production response class. Target of data transformation
/// that converts from MQTT topic and payload into a persistent object.
Class Solution.RAWDATA Extends %Persistent
{

Property seq As %BigInt;

Property p1 As %Integer;

Property p2 As %Integer;

Property p3 As %Integer;

Property p4 As %Integer;

ClassMethod INSERT(seq, p1, p2, p3, p4) As %Status
{
    &SQL(INSERT INTO RAWDATA (seq, p1,p2,p3,p4) VALUES (:seq, :p1,:p2,:p3,:p4))
    Quit $$$OK
}

ClassMethod GETNEWID() As %Integer
{
    Quit $INCREMENT(^RAWDATAUNIQ)
}

}
