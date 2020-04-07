/// 
Class Demo.EKGRouter Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.MQTT.Message' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='PatientID' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Topic' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Reading' type='Demo.HeartRate' instantiate='0' />
</context>
<sequence xend='200' yend='450' >
<transform name='Transform' class='Demo.EnsMessageToReading' source='request' target='context.Reading' xpos='200' ypos='250' />
<code xpos='204' ypos='349' >
<![CDATA[ set st = context.Reading.%Save()
 $$$TRACE(st)]]>
</code>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
