Class Demo.MetricMQTT Extends Ens.BusinessMetric
{

Parameter ADAPTER = "EnsLib.MQTT.Adapter.Inbound";

Parameter HISTORY = 50;

Property BPM As Ens.DataType.Metric;

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
   
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare("select distinct patientID from Demo.HeartRate" )
    SET rset = tStatement.%Execute()
   
    while (rset.%Next()) {
        w rset.BPM
    }
    

	
	Quit $$$OK
}

}
