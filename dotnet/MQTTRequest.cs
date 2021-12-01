using System;

namespace dc
{
    public class  MQTTRequest: InterSystems.EnsLib.PEX.Message {
        public string   topic;
        public long     seq;
        public string   values;

        // Overload class constructor method so that casting from Object class works correctly
        public MQTTRequest(string topic, long seq, string values) {
            this.topic=topic;
            this.seq=seq;
            this.values=values;
         }

        public MQTTRequest() { }
    }
}
