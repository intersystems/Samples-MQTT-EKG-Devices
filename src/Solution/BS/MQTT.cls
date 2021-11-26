/// Description
Class Solution.BS.MQTT Extends EnsLib.MQTT.Service.Passthrough
{

Property gw As %RegisteredObject;

Method OnProcessInput(pInput As EnsLib.MQTT.Message, pOutput As %RegisteredObject) As %Status
{
	#dim tSC As %Status = $$$OK
	#dim e As %Exception.AbstractException
	
	Try {

		$$$LOGINFO("Topic:"_pInput.Topic_" Value:"_pInput.StringValue)
		#; log raw data to a global for debugging purpose
		Set ^log($INCREMENT(^log))=pInput.StringValue

		#; Do something in .NET
		$$$LOGINFO(..gw.new("System.DateTime",0).Now)
		set proxy = ..gw.new("dc.MyLibrary")
		Set newpInput=proxy.DoSomethingNative(pInput.Topic, pInput.StringValue)
		$$$LOGINFO("newpInput:"_newpInput)

		Set tSC=##super(newpInput,pOutput)
	} Catch e {
		Set tSC=e.AsStatus()
	}
		
	Quit tSC
}

Method Test()
{
	// Return String.Joined array of primitive types 
	// This would return comma separated values such as 0,1,2,3,4,5,6,7,8,9...
	Set joinedarray=proxy.TestArray()
	$$$LOGINFO("Array:"_joinedarray)
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
