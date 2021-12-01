using System;
using InterSystems.Data.IRISClient.Gateway;
using InterSystems.Data.IRISClient.ADO;

namespace dc
{
    public class MQTTOperation : InterSystems.EnsLib.PEX.BusinessOperation
    {

        public override void OnTearDown() { } // Abstract method in PEX superclass. Must override.
        public override void OnInit() { } // Abstract method in PEX superclass. Must override.


        public override object OnMessage(object request)
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
            int columncount = 4;

            int[] array = new int[rowcount];
            for (int i = 0; i < rowcount; i++)
            {
                array[i] = i;
            }
            // --Write your code here--

            IRIS iris = GatewayContext.GetIRIS();
            // Native API
            // Save decoded values into IRIS via Native API
            seqno = (long)iris.ClassMethodLong("Solution.RAWDATA", "GETNEWID");
            for (int i = 0; i < rowcount; i += columncount)
            {
                iris.ClassMethodStatusCode("Solution.RAWDATA", "INSERT", seqno, array[i], array[i + 1], array[i + 2], array[i + 3]);
            }

            return null;

        }

    }
}
