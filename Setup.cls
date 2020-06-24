class Setup {

ClassMethod Initialize(DockerCompose) As %Status
{       do $System.OBJ.Load("/opt/app/Installer.cls","ck")
        set st = ##class(App.Installer).setup()
        zn "INTEROP"
        set namespace = $ZNspace
        set st = $System.OBJ.LoadDir("/opt/app/src", "ck", ,1)
        set app = $System.CSP.GetDefaultApp(namespace) _ "/"
	do EnableDeepSee^%SYS.cspServer(app)
        
        set StudentID = ##class(%SYSTEM.Util).GetEnviron("AVL_STUDENT_ID")
        if DockerCompose {
                set StudentID = "Student_" _ $Random(100)
                
        }
        Set file=##class(%File).%New("/datavol/script.js")
        do file.Open("w")
        do file.WriteLine("let sessionID = "_StudentID)

        set pSettings("From_EKG_MQTT","Adapter", "Topic")= StudentID _ "/acmeHospital/EKG/#"
        set st =##class(Solution.MQTT).ApplySettings("Solution.MQTT", .pSettings)
        return $$$OK
}
}



