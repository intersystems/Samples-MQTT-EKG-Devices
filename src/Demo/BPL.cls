/// 
Class Demo.BPL Extends Ens.BusinessProcessBPL
{

/// This BPLError block indicates that a BPL Diagram 
/// containing errors was saved.
/// To correct this class:
/// * Open it using the Studio BPL Editor,
/// * Correct the errors, and,
/// * Save the diagram.
/// Do not edit the contents of the BPLError block
/// or you may lose your diagram.
XData BPLError
{
<diagram Name="Demo.BPL" Width="2000" Height="2000" Layout="automatic" Language="objectscript" Request="Ens.Request" Response="Ens.Response" LastModified="" Version="" Includes="" ShowAnnotation="0">
<shape _index="0" _Type="start" Name="" xPos="200" yPos="150" />
<shape _index="1" _Type="end" Name="" xPos="185" yPos="331" />
<shape _index="2" _Type="continue" Name="res" xPos="268" yPos="251" />
<connection _Type="connector" Name="" from="0" to="2"/>
<connection _Type="connector" Name="" from="2" to="1"/>
</diagram>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
