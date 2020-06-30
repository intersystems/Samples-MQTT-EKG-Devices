Class App.Installer
{

XData MyInstall [ XMLNamespace = INSTALLER ]
{
<Manifest>
  <Default Name="NAMESPACE" Value="INTEROP"/>
  <Default Name="DBNAME" Value="INTEROP"/>
  <Default Name="APPPATH" Dir="/opt/app/" />
  <Default Name="SOURCESPATH" Dir="${APPPATH}src" />
  <Default Name="RESOURCE" Value="%DB_${DBNAME}" /> 

  <Namespace Name="${NAMESPACE}" Code="${DBNAME}-CODE" Data="${DBNAME}-DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="${DBNAME}-CODE" Dir="${APPPATH}${DBNAME}-CODE" Create="yes" Resource="${RESOURCE}"/>
      <Database Name="${DBNAME}-DATA" Dir="${APPPATH}${DBNAME}-DATA" Create="yes" Resource="${RESOURCE}"/>
    </Configuration>

    <Import File="${SOURCESPATH}" Recurse="1"/>
    
      
    
  </Namespace>

</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "MyInstall")
}


ClassMethod Initialize() As %Status
{
  //
  set st = ..setup()
  $$$ThrowOnError(st)
 
  //
  set $namespace = "INTEROP"
  set st = $System.OBJ.LoadDir("/opt/app/src/", "ck", ,1)
  $$$ThrowOnError(st)
 
  //
  set app = $System.CSP.GetDefaultApp($namespace) _ "/"
  do EnableDeepSee^%SYS.cspServer(app)
  return $$$OK
}

ClassMethod InitializeLearningLab() As %Status
{
  //
  set $namespace = "INTEROP"
  set st = ##class(Ens.Director).StopProduction()
  $$$ThrowOnError(st)
 
  // get source files
  set st = $System.OBJ.LoadDir("/home/project/shared/Samples-MQTT-EKG-Devices/src", "ck", ,1)
  $$$ThrowOnError(st)
 
  // configure namespace
  set app = $System.CSP.GetDefaultApp($namespace) _ "/"
  do EnableDeepSee^%SYS.cspServer(app)
 
  // configure EKG app
  set StudentID = ##class(%SYSTEM.Util).GetEnviron("AVL_STUDENT_ID")
  set StudentID = $Piece(StudentID, "@", 1)
  set TopicString = "/" _ StudentID _ "/acmeHospital/EKG/#"
  set pSettings("From_EKG_MQTT","Adapter", "Topic")= TopicString
  set st =##class(Solution.MQTT).ApplySettings("Solution.MQTT", .pSettings)
  Set file=##class(%File).%New("/home/project/shared/Samples-MQTT-EKG-Devices/App/config.js")
  Do file.Open("WSN")
 Do file.WriteLine("let TopicString = "_""""_TopicString_"""")
 
  //
  write "You have successfully initiated the MQTT exercise", !
  write "Please take note of your topic top-level string: " _ TopicString,!
  Read "press enter to continue",output, !, !
  return $$$OK
}

ClassMethod InitializeDocker() As %Status
{
  //
  set $namespace = "INTEROP"
  set StudentID = "Student_" _ $Random(10000)
  set TopicString = "/" _ StudentID _ "/acmeHospital/EKG/#"
  set pSettings("From_EKG_MQTT", "Adapter", "Topic") = TopicString
  set st = ##class(Solution.MQTT).ApplySettings("Solution.MQTT", .pSettings)
  set file = ##class(%File).%New("/datavol/App/config.js")
  do file.Open("WSN")
  do file.WriteLine("let TopicString = "_""""_ TopicString _"""")
 
  //
  write "You have successfully initiated the MQTT exercise", !
  write "Please take note of your topic top-level string: " _ TopicString,!
  Read "press enter to continue",output, !, !
  return $$$OK
}

