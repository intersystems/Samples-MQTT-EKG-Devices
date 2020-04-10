class Setup {

ClassMethod Initialize() As %Status
{       do $System.OBJ.Load("/opt/app/Installer.cls","ck")
        set st = ##class(App.Installer).setup()
        zn "INTEROP"
        set namespace = $ZNspace
        set st = $System.OBJ.LoadDir("/opt/app/src", "ck", ,1)
        set app = $System.CSP.GetDefaultApp(namespace) _ "/"
	do EnableDeepSee^%SYS.cspServer(app)
        return $$$OK
}
}