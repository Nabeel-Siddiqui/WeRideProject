window.addEventListener('DOMContentLoaded', (event) => {

// driverDisplay()
const newRideForm = document.querySelector(".create-new-ride")
const currentRide = document.querySelector("#currentRide")
let containerDiv = document.querySelector(".container")
const allRide = document.querySelector("#allRides")

let driver_rand_id;

newRideForm.addEventListener("submit", (event) => {
    event.preventDefault()
    containerDiv.innerHTML = ""

    
    let startRide = event.target.start.value
    let endRide = event.target.end.value
    const  arr = []
    
    fetch("http://localhost:3000/drivers")
    .then(r => r.json())
    .then((driverArray) => {  
        driverArray.forEach(driver => {
            // renderRandomDriver(driver)
            arr.push(driver)
            // console.log(driver)
            renderRandomDriver(driver)
            
        });
        // console.log(Math.floor(Math.random() * (arr.length-1)))
        // console.log(arr[0].id)
        driver_rand_id = parseInt(Math.floor(Math.random() * (arr.length+1)))
        
        fetch("http://localhost:3000/rides", {
        method:'POST',
        headers: { 
            'Content-Type':'application/json',
            'accept':'application/json'
        },
        body: JSON.stringify({
            start: startRide,
            end: endRide,
            driver_id: driver_rand_id,
            rider_id: 1
        })
    })
    .then(r => r.json())
    .then((newRide) => {
        // debugger
        // renderRandomDriver(newRide)
        // debugger
        renderAllRides(newRide)
        debugger
        // renderRandomDriver(newRide)

        // console.log(newRide)
        // console.log(driver_rand_id)
        event.target.reset()
    })
    })

    fetch("http://localhost:3000/rides")
    .then(r => r.json())
    .then((rideArray) => {    
        rideArray.forEach(ride => {
            renderAllRides(ride)
        })
    })
})


function renderAllRides(ride){
    let rideOl = document.createElement("ol")
    let rideStart = document.createElement("ol")
    rideStart.innerText = `Start Location: ${ride.start}`
    let rideEnd = document.createElement("ol")
    rideEnd.innerText = `Ending Location: ${ride.end}`
    // let rideCost = document.createElement("ol")
    // rideCost.innerText = `Ride Cost: ${ride.cost}`
    let rideDriverId = document.createElement("ol")
    rideDriverId.innerText = `Driver: ${ride.driver_id}`

    let updateButton = document.createElement("button")
    updateButton.innerText = "Update"

    let deleteButton = document.createElement("button")
    deleteButton.innerText = "Delete"
    deleteButton.className = "Danger"   

    rideOl.append(rideStart, rideEnd, rideDriverId, updateButton, deleteButton)
    allRide.append(rideOl)
    

    rideOl.addEventListener('click', event => {
        if(event.target.className === "Danger"){

            fetch(`http://localhost:3000/rides/${ride.id}`, {
                method: "DELETE"
            })
            .then(r => r.json())
            .then(r => {
                event.target.parentElement.remove()
            })
        }
    })
    
    updateButton.addEventListener("click", () => {
        let newForm = document.createElement("form")
        newForm.className = "new-end-ride"
        let formInput = document.createElement("input")
        formInput.type = "text"
        formInput.name = "end"
        formInput.placeholder = "Enter New Ending Location"
        let formInputSubmit = document.createElement("submit")
        formInputSubmit.type = "submit"
        formInputSubmit.name = "submit"
        newForm.append(formInput)
        rideEnd.append(newForm)
        


        newForm.addEventListener("submit", (event) => {
            event.preventDefault()

            let newEndRide = event.target.end.value
            
            fetch(`http://localhost:3000/rides/${ride.id}`, {
                method:'PATCH',
                headers: { 
                    'content-type': 'application/json',
                    'accept': 'application/json'
                },
                body: JSON.stringify({
                end: newEndRide
                })
            })
            .then(r => r.json())
            .then((newEnd) => {
                rideEnd.innerText = newEndRide
            })

        })


    allRide.append(rideOl)


})

}
})

function  renderRandomDriver(driver){
    const currentRide = document.querySelector("#currentRide")
    let driverLi = document.createElement("ol")
    let driverName = document.createElement("ol")
    driverName.innerText = driver.name
    let carName = document.createElement("ol")
    carName.innerText = driver.car
    let driverRating = document.createElement("ol")
    driverRating.innerText = driver.rating
    let driverImg = document.createElement("img")
    driverImg.src = driver.image
    let carImg = document.createElement("img")
    carImg.src = driver.car_image
    driverLi.append(driverName, carName, driverRating) //driverImg, carImg)

    currentRide.append(driverLi)

}

