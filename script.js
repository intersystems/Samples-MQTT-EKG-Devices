// var sPatient1 = document.getElementById("patient1");
// var sPatient1output = document.getElementById("patient1BPM");
// sPatient1output.innerHTML = sPatient1.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
// sPatient1.oninput = function() {
//     sPatient1output.innerHTML = this.value;
// }



var patientArray = [
]

function patient(bpm, name) {
    this.BPM = bpm;
    this.name = name;
    
}
function createPatient() {
    let name = `Patient-${patientArray.length}`
    
    let p = new patient(60,name)
    let card = $("<div style='margin:20px; width: 500px; border-style: solid'>")
    let title = $("<h3>")
    card.append(title)
    title.text(name)
    card.append("<h4 Heart Rate></h4>")
    let range = $(`<input type="range" value="60" min="0" max="300">`)
    card.append(range)
    let heart = $(`<img src='hrt.jpg' style="width:20px;height:20px; display: inline">`)
    heartID = `Heart-${name}`
    heart.attr("id", heartID)
    heart.hide()
    let bpmOutput = $('<p>60</p>')
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



createPatient()

function heartbeat(heartID){
    let selector = "#" + heartID
    console.log( selector)
    let h = $(selector)
    h.show()
    setTimeout(()=>{h.hide()}, 50)
    
    // heart.hide()
    // console.log('test')

    
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
    let masterTopic = "/acmeHospital/EKG/"
    patientArray.forEach((patient)=>{
        
        let topic = masterTopic + patient.name
        let message = new Paho.MQTT.Message(patient.BPM.toString())
        message.destinationName = topic
        
        
        client.send(message)
        // console.log('sent', topic)
        

    })
}

setInterval(sendEkgReadings, 1000)

