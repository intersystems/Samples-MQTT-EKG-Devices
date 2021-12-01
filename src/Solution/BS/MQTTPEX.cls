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
			// borrowing some code from EnsLib.PEX.Common
			set remoteSettings = $tr(value,$c(13))
			for j=1:1:$l(remoteSettings,$c(10)) {
				set oneLine = $p(remoteSettings,$c(10),j)
				set property = $p(oneLine,"=",1) continue:property=""
				If (property="TargetConfigNames") {
					set target = $p(oneLine,"=",2,*)
					If target'="" { Set pArray(target)="" }
				}
			}
		}
	}
	
	Quit
}

}
