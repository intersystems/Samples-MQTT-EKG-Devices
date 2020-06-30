Class Setup.Init
{

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
  set app = $System.CSP.GetDefaultApp(namespace) _ "/"
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
  set app = $System.CSP.GetDefaultApp(namespace) _ "/"
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
  write !,!,!, "You have successfully initialed the MQTT exercise", !
  write "Please take note of your topic top-level string: " _ TopicString
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
  write "You have successfully initialed the MQTT exercise", !
  write "Please take note of your topic top-level string: " _ TopicString
  write "test",  !, !
  return $$$OK
}