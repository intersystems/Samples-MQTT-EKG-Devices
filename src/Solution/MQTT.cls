Class Solution.MQTT Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Solution.MQTT" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Solution.MetricMQTT" Category="" ClassName="Solution.MetricMQTT" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">1</Setting>
  </Item>
  <Item Name="From_EKG_MQTT" Category="" ClassName="EnsLib.MQTT.Service.Passthrough" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Process_MQTT_Request</Setting>
    <Setting Target="Adapter" Name="Topic">/acmeHospital/EKG/#</Setting>
    <Setting Target="Adapter" Name="Url">tcp://mqtt.eclipse.org:1883</Setting>
  </Item>
  <Item Name="Process_MQTT_Request" Category="" ClassName="Solution.ProcessMQTTMessage" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
