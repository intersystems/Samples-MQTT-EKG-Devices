using System;
using InterSystems.Data.IRISClient.ADO;
using InterSystems.Data.IRISClient.Gateway;

using InterSystems.Data.IRISClient;

namespace dc
{
    public class MyLibrary
    {
        public string s1="abc";

        public IRISObject DoSomething(String mqtttopic, String mqttmsg)
        {
            // Get connection from existing gateway connection
            IRIS iris = GatewayContext.GetIRIS();
            String messageText="topic:"+mqtttopic+" value:"+mqttmsg;

            // Decode mqttmsg (raw data) into rows. It depends on how they are encoded.
            //
            // ++Write your code here++
            int rowcount=4;
            int[,] raw = new int[4,3] { { 1, 10,100 }, { 2, 20, 200 }, { 3, 30, 300 }, { 4, 40, 400 } };
            // --Write your code here--

            // Save decoded values into IRIS via Native API
            long seqno=(long)iris.ClassMethodLong("Solution.RAWDATA", "GETNEWID");
            for (int i=0; i<rowcount; i++) {
                iris.ClassMethodStatusCode("Solution.RAWDATA", "INSERT", seqno, raw[i,0],raw[i,1],raw[i,2]);
            }

            // Save decoded values into IRIS via ADO.NET
            // ADO.NET connection is not compatible with IRIS iris connection.
            // If you want to do this, you will have to open new connection for this.
            //String sqlStatement = "INSERT INTO RAWDATA (uuid,p1,p2,p3) VALUES (1,2,3)";
            // Cannot convert from 'InterSystems.Data.IRISClient.ADO.IRIS' to 'InterSystems.Data.IRISClient.IRISADOConnection' [/source/MyLibrary.csproj]
            //IRISCommand cmd1 = new IRISCommand(sqlStatement, iris);
            String host = "iris";
            String port = "1972";
            String username = "SuperUser";
            String password = "SYS";
            String Namespace = "INTEROP";
            IRISConnection IRISConnect = new IRISConnection();
            IRISConnect.ConnectionString = "Server = " + host 
                + "; Port = " + port + "; Namespace = " + Namespace 
                + "; Password = " + password + "; User ID = " + username;

            //ERROR #8104: Gateway Exception: <GATEWAY> InterSystems.Data.IRISClient.IRISException (0x80004005) System.Net.Sockets.Socket..ctor(AddressFamily addressFamily, SocketType socketType, ProtocolType protocolType) [IRIS Provider] Communication link failure: System.Net.Sockets.SocketException; Address family not supported by protocol ---> System.Net.Sockets.SocketException (97): Address family not supported by protocol
            IRISConnect.Open();
            String sqlStatement = "INSERT INTO Solution.RAWDATA (seq,p1,p2,p3) VALUES (1000,1001,1002,1003)";
            IRISCommand cmd = new IRISCommand(sqlStatement, IRISConnect);
            cmd.ExecuteNonQuery();


            // Return a message.
            IRISObject request = (IRISObject)iris.ClassMethodObject("Ens.StringContainer", "%New", seqno);
            return request;
        }
        public int GetNumber()
        {
            return 123;
        }

    }
}
