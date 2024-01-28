function transportBook(){
    document.getElementById("fullPage").style.display = "none";
    document.getElementById("Form").style.display = "block";
    document.getElementById("overlay").style.display = "block";
}

function backToMain(){
    document.getElementById("fullPage").style.display = "grid";
    document.getElementById("Form").style.display = 'none';
    document.getElementById("Bookings").style.display = 'none';
}

class bookingInfo{
    constructor() {
        this.sellerName = "";
        this.productName = ""
        this.sellingPrice = ""
        this.phoneNumber = ""
        this.location = ""
        this.quantity = ""
        this.startDate = ""
        this.endDate = ""
        // this.image = ""

    }
}
function formBookingData(){
    let info = new bookingInfo();
    info.sellerName = document.getElementById("nameInput").value;
    info.productName = document.getElementById("produceInput").value;
    info.transportPrice = document.getElementById("transportPriceInput").value;
    info.phoneNumber = document.getElementById("phoneNoInput").value;
    info.pickUpLocation = document.getElementById("locationPickUpInput").value;
    info.dropOffLocation = document.getElementById("locationDropOffInput").value;
    info.quantity = document.getElementById("quantityInput").value;
    info.pickUpDate = document.getElementById("pick-up-date").value;
    return info;
}


function putInBooking(){
    let info = formBookingData();
    let text = `Name:${info.sellerName} <br> 
                        Product Name:${info.productName}<br>
                        Transport Price:${info.transportPrice}<br>
                        Contact Info: +91 ${info.phoneNumber}<br>
                        Pick Up Location:${info.pickUpLocation}<br>
                        Drop Off Location:${info.dropOffLocation}<br>
                        Quantity:${info.quantity}<br>
                        Pick Up Date:${info.pickUpDate}<br>`;

    document.getElementById("bookingDetails").innerHTML = text;
    document.getElementById("bookingDetails").style.textAlign = 'left';
    document.getElementById("itemImage").style.display = "grid";
    document.getElementById("offer1").style.display = "grid";
    document.getElementById("offer2").style.display = "grid";
    document.getElementById("offer3").style.display = "grid";

}

function bookingsPage(){
    document.getElementById("fullPage").style.display = "none";
    document.getElementById("Form").style.display = "none";
    document.getElementById("overlay").style.display = "none";
    document.getElementById("Bookings").style.display = "grid";
}

function offer1Accept (){
    document.getElementById("offer1Status").innerHTML = "Accepted!";
    document.getElementById("offer2Status").innerHTML = 'Rejected!';
    document.getElementById("offer3Status").innerHTML = 'Rejected!';

    document.getElementById("offer1Status").style.color = '#009955';
    document.getElementById("offer2Status").style.color = '#ff0000';
    document.getElementById("offer3Status").style.color = '#ff0000';
}
function offer2Accept (){
    document.getElementById("offer1Status").innerHTML = "Rejected!";
    document.getElementById("offer2Status").innerHTML = 'Accepted!';
    document.getElementById("offer3Status").innerHTML = 'Rejected!';

    document.getElementById("offer1Status").style.color = '#ff0000';
    document.getElementById("offer2Status").style.color = '#009955';
    document.getElementById("offer3Status").style.color = '#ff0000';
}
function offer3Accept (){
    document.getElementById("offer1Status").innerHTML = "Rejected!";
    document.getElementById("offer2Status").innerHTML = 'Rejected!';
    document.getElementById("offer3Status").innerHTML = 'Accepted!';

    document.getElementById("offer1Status").style.color = '#ff0000';
    document.getElementById("offer2Status").style.color = '#ff0000';
    document.getElementById("offer3Status").style.color = '#009955';
}

function offer1Reject (){
    document.getElementById("offer1Status").innerHTML = "Rejected!";

    document.getElementById("offer1Status").style.color = '#ff0000';

}

function offer2Reject (){
    document.getElementById("offer2Status").innerHTML = "Rejected!";

    document.getElementById("offer2Status").style.color = '#ff0000';

}

function offer3Reject (){
    document.getElementById("offer3Status").innerHTML = "Rejected!";

    document.getElementById("offer3Status").style.color = '#ff0000';

}


