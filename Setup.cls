Class Setup.Init
{

ClassMethod Initialize() As %Status
{
        do $System.OBJ.Load("/opt/app/Installer.cls","ck")
        set st = ##class(App.Installer).setup()
        $$$ThrowOnError(st)
        zn "INTEROP"
        set namespace = $ZNspace
        set st = $System.OBJ.LoadDir("/opt/app/src/", "ck", ,1)
        $$$ThrowOnError(st)
        set app = $System.CSP.GetDefaultApp(namespace) _ "/"
	do EnableDeepSee^%SYS.cspServer(app)
        
        return $$$OK
}

ClassMethod InitializeLearningLab() As %Status
{

        zn "INTEROP"
        set st = ##class(Ens.Director).StopProduction()
        $$$ThrowOnError(st)
        set st = $System.OBJ.LoadDir("/home/project/shared/Samples-MQTT-EKG-Devices", "ck", ,1)
         $$$ThrowOnError(st)
        set namespace = $ZNspace
        set app = $System.CSP.GetDefaultApp(namespace) _ "/"

	do EnableDeepSee^%SYS.cspServer(app)


        set StudentID = ##class(%SYSTEM.Util).GetEnviron("AVL_STUDENT_ID")
        set StudentID = $Piece(StudentID, "@", 1)
        
        set pSettings("From_EKG_MQTT","Adapter", "Topic")= StudentID _ "/acmeHospital/EKG/#"
        set st =##class(Solution.MQTT).ApplySettings("Solution.MQTT", .pSettings)
        

        
        Set file=##class(%File).%New("/home/project/shared/Samples-MQTT-EKG-Devices/config.js")
        Do file.Open("WSN")
        $$$ThrowOnError(st)
        Do file.WriteLine("let SessionID = "_""""_StudentID_"""")

        write !,!,!, "You have successfully initialed the MQTT exercise", ! 
        write "Please take note of your topic top-level string: " _StudentID _ "/acmeHospital/EKG/#"
}

ClassMethod DockerInit() As %Status
{
       
        set StudentID = "Student_" _ $Random(100)

        set pSettings("From_EKG_MQTT","Adapter", "Topic")= StudentID _ "/acmeHospital/EKG/#"
        set st =##class(Solution.MQTT).ApplySettings("Solution.MQTT", .pSettings)
        Set file=##class(%File).%New("/datavol/config.js")
        Do file.Open("WSN")
        Do file.WriteLine("let SessionID = "_""""_StudentID_"""")

        write "You have successfully initialed the MQTT exercise", ! 
        write "Please take note of your topic top-level string: " _StudentID _ "/acmeHospital/EKG/#"
}

}
