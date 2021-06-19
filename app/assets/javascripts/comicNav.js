var current_strip  = window.location.pathname; 
var first_strip    = document.querySelectorAll(".fa-angle-double-left");
var previous_strip = document.querySelectorAll(".fa-angle-left");
var next_strip     = document.querySelectorAll(".fa-angle-right");
var last_strip     = document.querySelectorAll(".fa-angle-double-right");

for (i = 0; i < 2; i++){
  if (first_strip[i].pathname == current_strip) {
    first_strip[i].setAttribute('href', "#");
    first_strip[i].classList.add("disabled");
    first_strip[i].querySelector(".visually-hidden").remove();
  }
  if (previous_strip[i].pathname == current_strip) {
    previous_strip[i].setAttribute('href', "#");
    previous_strip[i].classList.add("disabled");
    previous_strip[i].querySelector(".visually-hidden").remove();
  }
  if (next_strip[i].pathname == current_strip) {
    next_strip[i].setAttribute('href', "#");
    next_strip[i].classList.add("disabled");
    next_strip[i].querySelector(".visually-hidden").remove();
  }
  if (last_strip[i].pathname == current_strip) {
    last_strip[i].setAttribute('href', "#");
    last_strip[i].classList.add("disabled");
    last_strip[i].querySelector(".visually-hidden").remove();
  }
}