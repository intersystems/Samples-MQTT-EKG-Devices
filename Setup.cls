Class Setup.Init
{

ClassMethod Initialize(DockerCompose As %Boolean = 0) As %Status
{
       do $System.OBJ.Load("/opt/app/Installer.cls","ck")
        set st = ##class(App.Installer).setup()
        zn "INTEROP"
        set namespace = $ZNspace
        set st = $System.OBJ.LoadDir("/opt/app/src", "ck", ,1)
        set app = $System.CSP.GetDefaultApp(namespace) _ "/"
	do EnableDeepSee^%SYS.cspServer(app)
        
        
        if DockerCompose=0 {
               set StudentID = ##class(%SYSTEM.Util).GetEnviron("AVL_STUDENT_ID")
               Do file.WriteLine("let SessionID = "_""""_StudentID_"""") 
               set pSettings("From_EKG_MQTT","Adapter", "Topic")= StudentID _ "/acmeHospital/EKG/#"
                                
        }
       
        
        set st =##class(Solution.MQTT).ApplySettings("Solution.MQTT", .pSettings)
        return $$$OK
}

ClassMethod DockerInit() As %Status
{
       
        set StudentID = "Student_" _ $Random(100)
        Set file=##class(%File).%New("/datavol/config.js")
        Do file.Open("WSN")
}

}
