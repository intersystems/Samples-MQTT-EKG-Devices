/// Interoperability production XML, should be viewed in the management portal.
Class Solution.MQTT Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Solution.MQTT" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Solution.MetricMQTT" Category="" ClassName="Solution.MetricMQTT" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">1</Setting>
  </Item>
  <Item Name="From_MQTT" Category="" ClassName="EnsLib.MQTT.Service.Passthrough" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Decode_MQTT_PEX</Setting>
    <Setting Target="Adapter" Name="Topic">/Student_6084/acmeHospital/EKG/#</Setting>
    <Setting Target="Adapter" Name="Url">tcp://mqttbroker:1883</Setting>
  </Item>
  <Item Name="From_MQTT_EXT" Category="" ClassName="Solution.BS.MQTT" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Process_NoOp</Setting>
    <Setting Target="Adapter" Name="Topic">/Student_6084/acmeHospital/EKG/#</Setting>
    <Setting Target="Adapter" Name="Url">tcp://mqttbroker:1883</Setting>
  </Item>
  <Item Name="Process_MQTT_Request" Category="" ClassName="Solution.ProcessMQTTMessage" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Process_NoOp" Category="" ClassName="Solution.BP.NoOp" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Decode_MQTT_PEX" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">dc.MyLibraryOperation</Setting>
    <Setting Target="Host" Name="%gatewayHost">netgw</Setting>
    <Setting Target="Host" Name="%gatewayPort">55556</Setting>
  </Item>
  <Item Name="From_MQTT_PEX" Category="" ClassName="Solution.BS.MQTTPEX" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%remoteClassname">dc.MyLibraryService</Setting>
    <Setting Target="Host" Name="%gatewayHost">netgw</Setting>
    <Setting Target="Host" Name="%gatewayPort">55556</Setting>
    <Setting Target="Adapter" Name="Topic">/Student_6084/acmeHospital/EKG/#</Setting>
    <Setting Target="Adapter" Name="Url">tcp://mqttbroker:1883</Setting>
    <Setting Target="Host" Name="%remoteSettings">TargetConfigNames=Process_NoOp</Setting>
  </Item>
</Production>
}

}
