Class Solution.RAWDATAC Extends (%Persistent, %XML.Adaptor, Ens.Util.RequestBodyMethods)
{

Property seq As %BigInt;

Property recs As list Of RAWDATA;

Index idxseq on seq;

Method %OnNew(seq As %BigInt) As %Status [ Private, ServerOnly = 1 ]
{
    Set ..seq=seq
    Set tStatement=##class(%SQL.Statement).%New()
    Set rs=tStatement.%ExecDirect(,"select ID from Solution.RAWDATA where seq=?",seq)
    While(rs.%Next()) {
        Set o=##class(Solution.RAWDATA).%OpenId(rs.ID)
        Do ..recs.Insert(o)
    }
    Return $$$OK
}

Storage Default
{
<Data name="RAWDATACDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>seq</Value>
</Value>
<Value name="3">
<Value>recs</Value>
</Value>
</Data>
<DataLocation>^Solution.RAWDATACD</DataLocation>
<DefaultData>RAWDATACDefaultData</DefaultData>
<IdLocation>^Solution.RAWDATACD</IdLocation>
<IndexLocation>^Solution.RAWDATACI</IndexLocation>
<StreamLocation>^Solution.RAWDATACS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
