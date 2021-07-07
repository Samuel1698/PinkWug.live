//Event for window resize
window.addEventListener('resize', addWhiteSpace("resize")); 
//Turbolinks navigation
document.addEventListener('turbolinks:load', addWhiteSpace("Turbolinks: load")); 

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
    // if the whitespace div is a different height than the calculated difference
    // Then assign difference to whiteSpace
    // Fires once when page initially loads, and again if the page contains a comic
    // This way it can fill while comic loads
    if (whiteSpace != difference){
      whiteSpace = difference + "px";
      document.querySelector(".white_space").style.minHeight = whiteSpace;
      // console.log("Success " + whiteSpace);
      // console.log("=================================")
    }
    // else {
    //   console.log("No change. \nwhiteSpace: " + whiteSpace + "\nDifference: " + difference);
    //   console.log("=================================")
    // }
  } 
}