using System;
using InterSystems.Data.IRISClient.Gateway;
using InterSystems.Data.IRISClient.ADO;

namespace dc
{
    public class MQTTServicePEX2 : InterSystems.EnsLib.PEX.BusinessService
    {
        public string TargetConfigNames;

        public override void OnTearDown() { } // Abstract method in PEX superclass. Must override.
        public override void OnInit() { } // Abstract method in PEX superclass. Must override.

        public override object OnProcessInput(object request)
        {
            long seqno;

            LOGINFO("Message Received");
            IRISObject req = (IRISObject)request;
            LOGINFO("Received object: " + req.InvokeString("%ClassName", 1));

            String value = req.GetString("StringValue");
            LOGINFO("Received StringValue: " + value);

            String topic = req.GetString("Topic");
            LOGINFO("Received topic: " + topic);

            // Decode value (raw data) into rows. It depends on how they are encoded.
            //
            // ++Write your code here++
            int rowcount = 2000;

            int[] array = new int[rowcount];
            for (int i = 0; i < rowcount; i++)
            {
                array[i] = i;
            }
            // --Write your code here--

            IRIS iris = GatewayContext.GetIRIS();

            // Save decoded values into IRIS via Native API
            seqno = (long)iris.ClassMethodLong("Solution.MQTTDATA", "GETNEWID");
            // Pass an array as a comma separated String value.
            IRISObject newrequest = (IRISObject)iris.ClassMethodObject("Solution.MQTTDATA", "%New", topic,seqno,String.Join(",",array));

            // Iterate through target business components and send request message
            string[] targetNames = TargetConfigNames.Split(',');
            foreach (string name in targetNames)
            {
                SendRequestAsync(name, newrequest);
                LOGINFO("Target:" + name);

            }
            return null;
        }

    }
}
