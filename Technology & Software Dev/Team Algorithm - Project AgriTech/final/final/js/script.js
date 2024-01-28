let signup = document.getElementById('signin-button')
let travel = document.getElementById('travel-button')
let signUpCard = document.getElementById('signup')
let TravelCard = document.getElementById('travel')
let crossIcon = document.getElementById('cross-icon')


travel.addEventListener('click', function(){
    TravelCard.style.display == "flex" ? TravelCard.style.display = "none" : TravelCard.style.display = "flex"
});
crossIcon.addEventListener('click', function(){
    console.log('fir')
    signUpCard.style.display = "none" 
});