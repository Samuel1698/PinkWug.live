var navToggle = document.querySelector(".nav_toggle");
var navWrapper = document.querySelector(".nav_ul");
var main = document.getElementById("main");
var searchToggle = document.querySelector(".search_toggle");
var searchForm = document.querySelector(".search_form");

// Reset the Menu and Search
// Menu
navToggle.setAttribute("aria-expanded", "false");
navToggle.setAttribute("aria-label", "menu");
navWrapper.classList.remove("active");
// Search
searchForm.classList.remove("active");
searchToggle.classList.remove("active");
searchToggle.setAttribute("aria-label", "Open search"); //Label for search button
// Margin
main.classList.remove("search_margin", "menu_margin");

// Navigation Menu
navToggle.addEventListener("click", function () {
  if (navWrapper.classList.contains("active")) { //If menu is active when clicked
    this.setAttribute("aria-expanded", "false");
    this.setAttribute("aria-label", "menu");
    navWrapper.classList.remove("active");
    main.classList.remove("search_margin", "menu_margin");
  } else { // If menu is inactive when clicked
    navWrapper.classList.add("active");
    main.classList.add("menu_margin");
    this.setAttribute("aria-label", "close menu");
    this.setAttribute("aria-expanded", "true");
    // Close Search only if screen size allows
    if (window.innerWidth <= 540){
      searchForm.classList.remove("active");
      searchToggle.classList.remove("active");
    }
  }
});

// Search form
searchToggle.addEventListener("click", function() {
  // Toggle Search
  searchForm.classList.toggle("active");
  searchToggle.classList.toggle("active");
  main.classList.add("search_margin");
  // Close Menu only if screen size allows 
  if (window.innerWidth <= 540){
    navToggle.setAttribute("aria-expanded", "false");
    navToggle.setAttribute("aria-label", "menu");
    navWrapper.classList.remove("active");
    // Remove Menu Margin
    main.classList.remove("menu_margin");
  }
  if (searchToggle.classList.contains("active")) {
    searchToggle.setAttribute("aria-label", "Close search");
  } else {
    searchToggle.setAttribute("aria-label", "Open search");
    main.classList.remove("search_margin");
  }
});

// This needs some optimization
window.addEventListener('resize', changeButtons);
window.addEventListener('turbolinks:load', changeButtons);
window.addEventListener('load', changeButtons);

// Use this to also reset the nav toggle
function changeButtons(){
  kofi    = document.querySelector(".kofi");
  patreon = document.querySelector(".patreon");
  if (window.innerWidth >= 940) {
    navToggle.setAttribute("aria-expanded", "false");
    navToggle.setAttribute("aria-label", "menu");
    navWrapper.classList.remove("active");
    main.classList.remove("search_margin", "menu_margin");
  }
  if (window.innerWidth <= 555){
    kofi.getElementsByTagName("span")[0].innerHTML = "Ko-fi";
    patreon.getElementsByTagName("span")[0].innerHTML = "Patreon";
    kofi.classList.add('small');
    patreon.classList.add('small');

  }
  else if (window.innerWidth > 555){
    kofi.getElementsByTagName("span")[0].innerHTML = "Support me on Ko-fi";
    patreon.getElementsByTagName("span")[0].innerHTML = "Support me on Patreon";
    kofi.classList.remove('small');
    patreon.classList.remove('small');
  }
}
