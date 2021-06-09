// =======================================================================
// Header
// =======================================================================
let navToggle = document.querySelector(".nav_toggle");
let navWrapper = document.querySelector(".nav_ul");
let content = document.querySelector(".content");

navToggle.addEventListener("click", function () {
  if (navWrapper.classList.contains("active")) {
    this.setAttribute("aria-expanded", "false");
    this.setAttribute("aria-label", "menu");
    navWrapper.classList.remove("active");
    content.classList.remove("search_margin", "menu_margin");
  } else {
    navWrapper.classList.add("active");
    content.classList.add("menu_margin");
    this.setAttribute("aria-label", "close menu");
    this.setAttribute("aria-expanded", "true");
    searchForm.classList.remove("active");
    searchToggle.classList.remove("active");
  }
});

let searchToggle = document.querySelector(".search_toggle");
let searchForm = document.querySelector(".search_form");

searchToggle.addEventListener("click", showSearch);

function showSearch() {
  searchForm.classList.toggle("active");
  searchToggle.classList.toggle("active");
  content.classList.add("search_margin");

  navToggle.setAttribute("aria-expanded", "false");
  navToggle.setAttribute("aria-label", "menu");
  navWrapper.classList.remove("active");
  content.classList.remove("menu_margin");

  if (searchToggle.classList.contains("active")) {
    searchToggle.setAttribute("aria-label", "Close search");
  } else {
    searchToggle.setAttribute("aria-label", "Open search");
    content.classList.remove("search_margin");
  }
}

// =======================================================================
// Comic Navigation
// =======================================================================

let current_strip  = window.location.pathname; 
let first_strip    = document.querySelectorAll(".fa-angle-double-left");
let previous_strip = document.querySelectorAll(".fa-angle-left");
let next_strip     = document.querySelectorAll(".fa-angle-right");
let last_strip     = document.querySelectorAll(".fa-angle-double-right");

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

window.addEventListener('onresize', changeWindowSize);
window.addEventListener('load', changeWindowSize);

function changeWindowSize(){
  let viewPort      = window.innerHeight;
  let headerHeight  = document.querySelector(".header").offsetHeight;
  let contentHeight = document.querySelector(".content").offsetHeight;
  let footerHeight  = document.querySelector(".footer").offsetHeight;
  
  let whiteSpace    = viewPort - (headerHeight + contentHeight + footerHeight + 25);
  whiteSpace = whiteSpace + "px";

  document.querySelector(".white_space").style.minHeight = whiteSpace;
}