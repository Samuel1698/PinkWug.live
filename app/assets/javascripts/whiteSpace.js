//Event for window resize
window.addEventListener('resize', addWhiteSpace("resize", 20)); 
//Turbolinks navigation
document.addEventListener('DOMContentLoaded', addWhiteSpace("DOMContentLoaded", 15)); 

function addWhiteSpace(content) {
  return function(){
    // Uncomment console.logs for debugging
    // console.log("---------------------------------");
    // console.log(content);
    var viewPort      = window.innerHeight;
    var headerHeight  = document.querySelector(".header").offsetHeight;
    var contentHeight = document.querySelector("main").offsetHeight;
    var footerHeight  = document.querySelector(".footer").offsetHeight;

    var whiteSpace    = document.querySelector(".white_space").offsetHeight;
    var difference    = viewPort - (headerHeight + contentHeight + footerHeight);
    difference = difference > 0 ? difference: 0;
    if (whiteSpace != difference){
      let space = difference + "px";
      document.querySelector(".white_space").style.minHeight = space;
      // Makes a loop by calling itself as long as there is a difference
      // setTimeout(addWhiteSpace("Loop"), 400);
      // console.log("Success " + space);
      // console.log("=================================")
    }
    // else {
    //   console.log("No change. \nwhiteSpace: " + whiteSpace + "\nDifference: " + difference);
    //   console.log("=================================")
    // }
  } 
}