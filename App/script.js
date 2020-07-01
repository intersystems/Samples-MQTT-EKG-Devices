

// The below script requires a declaration of a variable SubscriptionString in a config.js file. 
// Config.js is automatically created during the installation of this exercise.

$("#SubscriptionString").text(SubscriptionString) 

// Store array of patients added to project.
var patientArray = [
]

// Define patient constructor.
function Patient(bpm, name) {
    this.BPM = bpm;
    this.name = name;
    
}

// Onclick event for the 'Add' button
function createPatient() {

    // Create patient id
    let name = `Patient-${patientArray.length}`

    // Randomly set patient heart rate
    let bpm = Math.floor(Math.random()*160) + 40 

    // Construct patient object and push to the patients array.
    let patient = new Patient(bpm,name)
    patientArray.push(patient)

    // Create patient card object
    let card = $("<div style='margin:20px; width: 500px; border-style: solid'>")

    // Create and add title section for card
    let title = $("<h3>")
    card.append(title)

    // Insert patient id into card title element
    title.text(name)

    // Add section to card for heart rate data
    card.append("<h4 Heart Rate></h4>")

    // create and add slider
    let range = $(`<input type="range" value="${bpm}" min="40" max="200">`)
    card.append(range)

   
    
    // Create listener function for updating BPM slider
    
    
    // Heart image for flashing icon. Initialize to be hidden.
    let heart = $(`<img src='hrt.jpg' style="width:15px;height:15px; display: inline">`)
    let heartID = `Heart-${name}`
    heart.attr("id", heartID)
    heart.hide()
 
    // BPM value field below slider. Updates with slider.
    let bpmOutput = $(`<p>${bpm}</p>`)
    bpmOutput.append(heart)
    card.append("<br>")
    card.append('<h4>Beats per Minute (BPM)</h4>')
    card.append(bpmOutput)
    


    // Set interval for flashing heart. 
   
    // Get beats per second (bps)
    let bps = patient.BPM/60

    // Convert to time between beats in milliseconds.
    let interval = 1000/bps
    
    // Set interval with callback function heartbeat() on interval. Pass div id heartID into callback.
    let intervalObject = setInterval(heartbeat, interval, heartID)
    
    range.on("input",function(self){


        // Get slider value and assign it to the BPM value of patient object
        patient.BPM = range.val()

        // Update the BPM text field as well.     
        bpmOutput.text(patient.BPM)

        // Re-add heart icon after updating text
        bpmOutput.append(heart)
        // Calculate beats per second (bps)
        let bps = parseInt(patient.BPM)/60
        
        // Get interval in milliseconds for current bps
        let interval = 1000/bps
        
        // Remove current interval from DOM and set a new one based on updated
        // BPM
        clearInterval(intervalObject)
        
        intervalObject = setInterval(heartbeat, interval, heartID)
     })
     
    // Add card to page.
     $("#patients").append(card)
}




function heartbeat(heartID){

    // Locate heart icon with id passed into function.
    let selector = "#" + heartID
    let heart = $(selector)
    
    // toggle to show heart
    heart.show()

    // hide heart after 50 milliseconds. This function repeats on interval set above.
    setTimeout(()=>{heart.hide()}, 50)
}

// initialize page with patientNum number of patients
function CreatePatients(patientNum) {
    for (let i=0; i < patientNum; i ++) {
    
        createPatient()
    }
}

CreatePatients(3)






