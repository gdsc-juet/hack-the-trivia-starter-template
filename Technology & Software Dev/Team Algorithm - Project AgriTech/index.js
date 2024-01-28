const header = document.querySelector("header");
window.addEventListener("scroll",function(){
    headeer.classlist.toggle("sticky",window.scrollY > 120);
});