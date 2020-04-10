Class Demo.MQTT Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.MQTT" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="MQTT_TEST" Category="" ClassName="EnsLib.MQTT.Service.Passthrough" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Topic">/acmeHospital/EKG/#</Setting>
    <Setting Target="Adapter" Name="Url">tcp://mqtt.eclipse.org:1883</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Demo.EKGRouter</Setting>
    <Setting Target="Adapter" Name="CleanSession">0</Setting>
  </Item>
  <Item Name="Demo.EKGRouter" Category="" ClassName="Demo.EKGRouter" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="Demo.MetricMQTT" Category="" ClassName="Demo.MetricMQTT" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">1</Setting>
  </Item>
</Production>
}

}
