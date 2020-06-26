

// The below script requires a declaration of a variable in a config.js file. Do not attempt to run 
// this script before initializing this variable.

let subTopic = TopicString
let masterTopic = TopicString
$("#topicIDString").text(subTopic) 
var patientArray = [
]

function Patient(bpm, name) {
    this.BPM = bpm;
    this.name = name;
    
}
function createPatient() {
    let name = `Patient-${patientArray.length}`
    let bpm = Math.floor(Math.random()*220) + 40 
    let patient = new Patient(bpm,name)
    let card = $("<div style='margin:20px; width: 500px; border-style: solid'>")
    let title = $("<h3>")
    card.append(title)
    title.text(name)
    card.append("<h4 Heart Rate></h4>")
    let range = $(`<input type="range" value="${bpm}" min="40" max="220">`)
    card.append(range)
    let heart = $(`<img src='hrt.jpg' style="width:15px;height:15px; display: inline">`)
    let heartID = `Heart-${name}`
    heart.attr("id", heartID)
    heart.hide()
    let bpmOutput = $(`<p>${bpm}</p>`)
    bpmOutput.append(heart)
    
    range.on("input",function(self){
       patient.BPM = range.val()
       bpmOutput.text(patient.BPM)

       let bps = parseInt(patient.BPM)/60
       
       let interval = 1000/bps
       
       clearInterval(intervalObject)
       bpmOutput.append(heart)
       intervalObject = setInterval(heartbeat, interval, heartID)
    })
    
    card.append("<br>")
    card.append('<h4>Beats per Minute (BPM)</h4>')
    
   
    card.append(bpmOutput)
    

    $("#patients").append(card)
    patientArray.push(patient)
    let bps = patient.BPM/60
    let interval = 1000/bps
    
    let intervalObject = setInterval(heartbeat, interval, heartID)
    

}




function heartbeat(heartID){
    let selector = "#" + heartID
    let h = $(selector)
    h.show()
    setTimeout(()=>{h.hide()}, 50)
}
function OnConnect(){
    console.log("CONNECTED SUCESSFULLY")
}

let patientNum = 3
for (let i=0; i < patientNum; i ++) {
    
    createPatient()
}
// MQTT actions
var mLocation = {
    hostname: "mqtt.eclipse.org/mqtt",
    port: "80",
    path: "/"
}
    // Create a client instance
client = new Paho.MQTT.Client(mLocation.hostname, Number(mLocation.port), mLocation.path, "clientID");
client.onConnected = OnConnect

client.onConnectionLost = function (responseObject) {
    console.log("CONNECTION LOST - " + responseObject.errorMessage);
};
client.onMessageArrived = function (message) {
    console.log("RECEIVE ON " + message.destinationName + " PAYLOAD " + message.payloadString);
    print_first(message.payloadString);
};

var options = {
    timeout: 3,
    useSSL: true,
    keepAliveInterval: 30,
    onSuccess: function () {
        ("CONNECTION SUCCESS");
        client.subscribe('/topic/test', {qos: 1});
    },
    onFailure: function (message) {
        console.log("CONNECTION FAILURE - " + message.errorMessage);
    }
};
// connect the client
client.connect(options);




// send message

function sendEkgReadings(){
    
    
    patientArray.forEach((patient)=>{
        
        let topic = masterTopic.replace("#",  patient.name)
        let message = new Paho.MQTT.Message(patient.BPM.toString())
        message.destinationName = topic
        
        
        client.send(message)
        // console.log('sent', topic)
        

    })
}

setInterval(sendEkgReadings, 1000)

