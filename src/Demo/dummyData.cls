Class Demo.dummyData Extends (%Persistent, %Populate)
{

Property distance As %Integer;

Property time As %Integer;

Storage Default
{
<Data name="dummyDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>distance</Value>
</Value>
<Value name="3">
<Value>time</Value>
</Value>
</Data>
<DataLocation>^Demo.dummyDataD</DataLocation>
<DefaultData>dummyDataDefaultData</DefaultData>
<IdLocation>^Demo.dummyDataD</IdLocation>
<IndexLocation>^Demo.dummyDataI</IndexLocation>
<StreamLocation>^Demo.dummyDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
