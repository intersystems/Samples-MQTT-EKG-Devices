/// Description
Class Solution.BS.MQTT Extends EnsLib.MQTT.Service.Passthrough
{

Property gw As %RegisteredObject;

Method OnProcessInput(pInput As EnsLib.MQTT.Message, pOutput As %RegisteredObject) As %Status
{
	#dim iTarget As %Integer
	#dim tOneTarget As %String
	#dim tSyncCommit As %Integer

	#dim tSC,tSC1 As %Status = $$$OK
	#dim e As %Exception.AbstractException
	
	Try {
	
		#; Do something in .NET
		$$$LOGINFO(..gw.new("System.DateTime",0).Now)
		set proxy = ..gw.new("dc.MyLibrary")
		Set pInput=proxy.DoSomething()

		Set tSC=##super(pInput,pOutput)
	} Catch e {
		Set tSC=e.AsStatus()
	}
		
	Quit tSC
}

Method OnInit() As %Status
{
	Set ..gw=$SYSTEM.external.getRemoteGateway("netgw",55556)
	Quit $$$OK
}

Method OnTearDown() As %Status
{
	Do ..gw.disconnect()
	Set ..gw=$$$NULLOREF
	Quit $$$OK
}

}
