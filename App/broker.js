
// MQTT  connection details
var mLocation = {
    hostname: "mqtt.eclipse.org/mqtt",
    port: "80",
    path: "/"
}

// Create a client instance
client = new Paho.MQTT.Client(mLocation.hostname, Number(mLocation.port), mLocation.path, "ISCLearner")

// Callback function called when Paho connects successfully.
client.onConnected = function() {
    console.log("CONNECTED SUCCESSFULLY")
}

// Callback function when connection is lost.
client.onConnectionLost = function (responseObject) {
    console.log("CONNECTION LOST - " + responseObject.errorMessage);
}

// Sett connection options
var options = {
    timeout: 3,
    useSSL: true,
    keepAliveInterval: 30,
    onSuccess: function () {
        ("CONNECTION SUCCESS")
        
    },
    onFailure: function (message) {
        console.log("CONNECTION FAILURE - " + message.errorMessage)
    }
};

// connect the client
client.connect(options);




// Sends MQTT message for each patient in current DOM context.
function sendEkgReadings(){

    patientArray.forEach((patient)=>{
        // Publish to master topic, replacing # with the the patient id.
        let topic = masterTopic.replace("#",  patient.name)

        // Publish BPM as string in message field.
        let message = new Paho.MQTT.Message(patient.BPM.toString())
        message.destinationName = topic
        
        // Send message.
        client.send(message)

    })
}

// call sendEkgReadings once per second.
setInterval(sendEkgReadings, 1000)
