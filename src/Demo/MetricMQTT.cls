Class Demo.MetricMQTT Extends Ens.BusinessMetric
{

Parameter ADAPTER = "EnsLib.MQTT.Adapter.Inbound";

Parameter HISTORY = 50

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
ClassMethod OnGetInstances(ByRef pInstSet As %String) As %Status
{   
    For i=1:1:#HISTORY {
        
    }
    
	Set pInstSet(1) = "Apples"
	Set pInstSet(2) = "Bananas"
	Set pInstSet(3) = "Cherries"
	Set pInstSet(4) = "Dates"
	Set pInstSet(5) = "Eggplants"
	Set pInstSet(6) = "Figs"
	
	Quit $$$OK
}
}
