/* Copyright (c) 2020 by InterSystems Corporation.
   Cambridge, Massachusetts, U.S.A.  All rights reserved.
   Confidential property of InterSystems Corporation. */

/// Accepts files from the MQTT Inbound Adapter and forwards the container object to the configured target configuration item or items.
Class EnsLib.MQTT.Service.Passthrough Extends Ens.BusinessService [ ProcedureBlock, System = 4 ]
{

Parameter ADAPTER = "EnsLib.MQTT.Adapter.Inbound";

/// Configuration item(s) to which to send file stream messages
Property TargetConfigNames As %String(MAXLEN = 1000);

Parameter SETTINGS = "TargetConfigNames:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Method OnProcessInput(pInput As EnsLib.MQTT.Message, pOutput As %RegisteredObject) As %Status
{
	#dim iTarget As %Integer
	#dim tOneTarget As %String
	#dim tSyncCommit As %Integer
	 For  {
		 
	 }
	 

	#dim tSC,tSC1 As %Status = $$$OK
	#dim e As %Exception.AbstractException
	
	Try {
	
		$$$SyncCommitSet(tSyncCommit)

		For iTarget=1:1:$L(..TargetConfigNames, ",") { 
		
			Set tOneTarget=$ZStrip($P(..TargetConfigNames,",",iTarget),"<>W")
			If tOneTarget'="" {
				
				Set tSC1=..SendRequestAsync(tOneTarget,pInput)  
				If $$$ISERR(tSC1) Set tSC=$$$ADDSC(tSC,tSC1)
			}
		}
		
	} Catch e {
		Set tSC=e.AsStatus()
	}
	
	$$$SyncCommitClear(tSyncCommit)
	
	Quit tSC
}

/// Return an array of connections for drawing lines on the config diagram
ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
	#dim tValue,tOne As %String

	Do ##super(.pArray,pItem)
	
	If pItem.GetModifiedSetting("TargetConfigNames",.tValue) {
		For i=1:1:$L(tValue,",") { 
			Set tOne=$ZStrip($P(tValue,",",i),"<>W")
			If tOne'="" Set pArray(tOne)="" 
		}
	}
}

}
