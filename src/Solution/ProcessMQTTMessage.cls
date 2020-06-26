/// 
Class Solution.ProcessMQTTMessage Extends Ens.BusinessProcessBPL [ CompileAfter = Solution.HeartRate ]
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.MQTT.Message' response='Solution.HeartRate' height='2000' width='2000' >
<context>
</context>
<sequence xend='200' yend='450' >
<transform name='Transform' class='Solution.MQTTMessageToReading' source='request' target='response' xpos='200' ypos='250' />

</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
