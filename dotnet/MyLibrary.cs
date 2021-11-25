using System;
using InterSystems.Data.IRISClient.ADO;
using InterSystems.Data.IRISClient.Gateway;

namespace dc
{
    public class MyLibrary
    {
        public string s1="abc";

        public IRISObject DoSomething(String topic, String value)
        {
            // Get connection from existing gateway connection
            IRIS iris = GatewayContext.GetIRIS();
            String messageText="topic:"+topic+" value:"+value;

            //Create an IRIS object for later use.
            IRISObject request = (IRISObject)iris.ClassMethodObject("Ens.StringContainer", "%New", messageText);
            return request;
        }
        public int GetNumber()
        {
            return 123;
        }

    }
}
