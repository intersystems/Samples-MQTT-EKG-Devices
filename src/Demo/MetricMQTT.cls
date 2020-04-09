Class Demo.MetricMQTT Extends Ens.BusinessMetric
{

Parameter ADAPTER = "EnsLib.MQTT.Adapter.Inbound";

Property BPM As Ens.DataType.Metric(AUTOHISTORY = 50) [ MultiDimensional ];

Method OnProcessInput(pInput As EnsLib.MQTT.Message, pOutput As %RegisteredObject) As %Status
{
   
    #; Set temp = $GET(..BPM) + pInput.StringValue
    Set tSC = ##class(Ens.BusinessMetric).SetMetric("testServices","BPM",pInput.StringValue)
    set st = ..SendRequestAsync("Demo.EKGRouter",pInput)
	Quit ..CalculateMetrics()
}

Method OnCalculateMetrics() As %Status
{
    #; Set ..BPM = $GET(..BPM) + bp
    #; $$$TRACE("testing")
    return $$$OK
}

}
