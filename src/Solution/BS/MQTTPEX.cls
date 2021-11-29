Class Solution.BS.MQTTPEX Extends EnsLib.PEX.BusinessService
{

Parameter ADAPTER = "EnsLib.MQTT.Adapter.Inbound";

/// This method is called when Portal is drawing the production diagram
/// pArray contains the config names the scanner found.
/// Users can remove or add new names
ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
	Set count=pItem.Settings.Count() 
	For i=1:1:count {
		If (pItem.Settings.GetAt(i).Name="%remoteSettings") {
			Set value=pItem.Settings.GetAt(i).Value
			Set target=$P(value,"=",2)
			If target'="" { Set pArray(target)="" }
		}
	}
	
	Quit
}

}
