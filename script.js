// var sPatient1 = document.getElementById("patient1");
// var sPatient1output = document.getElementById("patient1BPM");
// sPatient1output.innerHTML = sPatient1.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
// sPatient1.oninput = function() {
//     sPatient1output.innerHTML = this.value;
// }


let sessionID=""
// sessionID = Math.random()*10000000000000000
let masterTopic = `${sessionID}/acmeHospital/EKG/`
let subTopic = masterTopic + "#"
$("#topicIDString").text(subTopic) 
var patientArray = [
]

function patient(bpm, name) {
    this.BPM = bpm;
    this.name = name;
    
}
function createPatient() {
    let name = `Patient-${patientArray.length}`
    let bpm = Math.floor(Math.random()*220) + 40 
    let p = new patient(bpm,name)
    let card = $("<div style='margin:20px; width: 500px; border-style: solid'>")
    let title = $("<h3>")
    card.append(title)
    title.text(name)
    card.append("<h4 Heart Rate></h4>")
    let range = $(`<input type="range" value="${bpm}" min="40" max="220">`)
    card.append(range)
    let heart = $(`<img src='hrt.jpg' style="width:15px;height:15px; display: inline">`)
    heartID = `Heart-${name}`
    heart.attr("id", heartID)
    heart.hide()
    let bpmOutput = $(`<p>${bpm}</p>`)
    bpmOutput.append(heart)
    
    range.on("input",function(self){
       p.BPM = range.val()
       bpmOutput.text(p.BPM)

       let bps = parseInt(p.BPM)/60
       
       let interval = 1000/bps
       console.log(heart)
       clearInterval(i)
       bpmOutput.append(heart)
       i = setInterval(heartbeat, interval, heartID)
    })
    
    card.append("<br>")
    card.append('<h4>Beats per Minute (BPM)</h4>')
    
   
    card.append(bpmOutput)
    

    $("#patients").append(card)
    patientArray.push(p)
    let bps = p.BPM/60
    let interval = 1000/bps
    
    let i = setInterval(heartbeat, interval, heartID)
    

}

let patientNum = 3
for (let i=0; i < patientNum; i ++) {
    
    createPatient()
}


function heartbeat(heartID){
    let selector = "#" + heartID
    let h = $(selector)
    h.show()
    setTimeout(()=>{h.hide()}, 50)
    


    
}

// MQTT actions
var mLocation = {
    hostname: "mqtt.eclipse.org",
    port: "80",
    path: "/mqtt"
}
    // Create a client instance
client = new Paho.MQTT.Client(mLocation.hostname, Number(mLocation.port), mLocation.path, "clientID");



// connect the client
client.connect();


// send message

function sendEkgReadings(){
    
    
    patientArray.forEach((patient)=>{
        
        let topic = masterTopic + patient.name
        let message = new Paho.MQTT.Message(patient.BPM.toString())
        message.destinationName = topic
        
        
        client.send(message)
        // console.log('sent', topic)
        

    })
}

setInterval(sendEkgReadings, 1000)

