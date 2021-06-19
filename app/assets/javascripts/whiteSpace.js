window.addEventListener('resize', changeWindowSize);
window.addEventListener('turbolinks:load', changeWindowSize);
window.addEventListener('load', changeWindowSize);

function changeWindowSize(){
  var viewPort      = window.innerHeight;
  var headerHeight  = document.querySelector(".header").offsetHeight;
  var contentHeight = document.querySelector(".main").offsetHeight;
  var footerHeight  = document.querySelector(".footer").offsetHeight;
  
  var whiteSpace    = viewPort - (headerHeight + contentHeight + footerHeight + 25);
  whiteSpace = whiteSpace > 0 ? (whiteSpace + "px") : 0;

  document.querySelector(".white_space").style.minHeight = whiteSpace;
}