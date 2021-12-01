/// 
Class Solution.BP.MQTT Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Solution.RAWDATAC' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<trace value='request.seq' xpos='200' ypos='250' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
