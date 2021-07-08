var current_strip  = window.location.pathname; 
var first_strip    = document.querySelectorAll(".fa-angle-double-left");
var previous_strip = document.querySelectorAll(".fa-angle-left");
var next_strip     = document.querySelectorAll(".fa-angle-right");
var last_strip     = document.querySelectorAll(".fa-angle-double-right");
var backwardsDiv   = document.querySelector(".backwards").parentElement;
var forwardDiv     = document.querySelector(".forward").parentElement;

for (i = 0; i < 2; i++){
  if (first_strip[i].pathname == current_strip) {
    first_strip[i].querySelector(".visually-hidden").remove();
    first_strip[i].removeAttribute('href');
    first_strip[i].classList.add("disabled");
  }
  if (previous_strip[i].pathname == current_strip) {
    previous_strip[i].querySelector(".visually-hidden").remove();
    previous_strip[i].removeAttribute('href');
    previous_strip[i].classList.add("disabled");
    backwardsDiv.removeAttribute('href');
    backwardsDiv.classList.add("disabled");
  }
  if (next_strip[i].pathname == current_strip || location.pathname == "/") {
    next_strip[i].querySelector(".visually-hidden").remove();
    next_strip[i].removeAttribute('href');
    next_strip[i].classList.add("disabled");
    forwardDiv.removeAttribute('href');
    forwardDiv.classList.add("disabled");
  }
  if (last_strip[i].pathname == current_strip || location.pathname == "/") {
    last_strip[i].querySelector(".visually-hidden").remove();
    last_strip[i].removeAttribute('href');
    last_strip[i].classList.add("disabled");
  }
}

var tooltip = document.querySelector('.tooltip');
tooltip.addEventListener("keyup", hitEnter);

function hitEnter(){
  if (event.keyCode === 13) {
    event.preventDefault();
    document.querySelector('.tooltip').click();
  }
}

function updateClipboard(newClip) {
  navigator.clipboard.writeText(newClip).then(function() {
    /* clipboard successfully set */
    tooltip.firstElementChild.innerHTML = 'link copied';    
  }, function() {
    /* clipboard write failed */
    tooltip.firstElementChild.innerHTML =  'copy failed';   
  });
  setTimeout(function(){
    tooltip.firstElementChild.innerHTML = 'copy link';
  }, 2000);
}
