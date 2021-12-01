Class App.Installer
{

XData MyInstall [ XMLNamespace = INSTALLER ]
{
<Manifest>
  <Default Name="NAMESPACE" Value="INTEROP"/>
  <Default Name="DBNAME" Value="INTEROP"/>
  <Default Name="APPPATH" Dir="/opt/irisbuild" />
  <Default Name="SOURCESPATH" Dir="${APPPATH}src" />
  <Default Name="RESOURCE" Value="%DB_${DBNAME}" /> 
  <Default Name="ProductionName" Value="Solution.MQTT"/>

  <Namespace Name="${NAMESPACE}" Code="${DBNAME}-CODE" Data="${DBNAME}-DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="${DBNAME}-CODE" Dir="${APPPATH}${DBNAME}-CODE" Create="yes" Resource="${RESOURCE}"/>
      <Database Name="${DBNAME}-DATA" Dir="${APPPATH}${DBNAME}-DATA" Create="yes" Resource="${RESOURCE}"/>
    </Configuration>

    <Import File="${SOURCESPATH}" Recurse="1"/>
    <Production Name="${ProductionName}" AutoStart="1"/>  
  </Namespace>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "MyInstall")
}

ClassMethod Initialize() As %Status
{
  // Call the setup method above.
  set st = ..setup()
  $$$ThrowOnError(st)
 
  // Switch to INTEROP namespace and load objectscript files in the src directory.
  set $namespace = "INTEROP"
  set st = $System.OBJ.LoadDir("/opt/irisbuild/src/", "ck", ,1)
  $$$ThrowOnError(st)
 
  // Enable analytics for the INTEROP namespace.
  set app = $System.CSP.GetDefaultApp($namespace) _ "/"
  do EnableDeepSee^%SYS.cspServer(app)

  return $$$OK
}

}
