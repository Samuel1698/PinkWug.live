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

let regex = /^[^#]*/;
let current_strip  = window.location.toString().match(regex).toString(); 
let first_strip    = document.querySelector(".fa-angle-double-left").href.toString().match(regex).toString();
let previous_strip = document.querySelector(".fa-angle-left").href.toString().match(regex).toString();
let next_strip     = document.querySelector(".fa-angle-right").href.toString().match(regex).toString();
let last_strip     = document.querySelector(".fa-angle-double-right").href.toString().match(regex).toString();

if (first_strip == current_strip) {
  let first_strip = document.querySelector(".fa-angle-double-left");  
  first_strip.setAttribute('href', "#");
  first_strip.classList.add("disabled");
}
if (previous_strip == current_strip) {
  let previous_strip = document.querySelector(".fa-angle-left");
  previous_strip.setAttribute('href', "#");
  previous_strip.classList.add("disabled");
}
if (next_strip == current_strip) {
  let next_strip = document.querySelector(".fa-angle-right");
  next_strip.setAttribute('href', "#");
  next_strip.classList.add("disabled");
}
if (last_strip == current_strip) {
  let last_strip = document.querySelector(".fa-angle-double-right");
  last_strip.setAttribute('href', "#");
  last_strip.classList.add("disabled");
}
