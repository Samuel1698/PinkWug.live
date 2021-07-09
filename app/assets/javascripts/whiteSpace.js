//Event for window resize
window.addEventListener('resize', addWhiteSpace("resize")); 
//Turbolinks navigation
document.addEventListener('DOMContentLoaded', addWhiteSpace("DOMContentLoaded")); 

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
    var difference    = viewPort - (headerHeight + contentHeight + footerHeight + 25);
    difference = difference > 0 ? difference: 0;
    if (whiteSpace != difference){
      whiteSpace = difference + "px";
      document.querySelector(".white_space").style.minHeight = whiteSpace;
      // Makes a loop by calling itself as long as there is a difference
      setTimeout(addWhiteSpace("Time Out"), 200);
      // console.log("Success " + whiteSpace);
      // console.log("=================================")
    }
    // else {
    //   console.log("No change. \nwhiteSpace: " + whiteSpace + "\nDifference: " + difference);
    //   console.log("=================================")
    // }
  } 
}