var navToggle = document.querySelector(".nav_toggle");
var navWrapper = document.querySelector(".nav_ul");
var main = document.querySelector(".main");
var searchToggle = document.querySelector(".search_toggle");
var searchForm = document.querySelector(".search_form");

navToggle.addEventListener("click", function () {
  if (navWrapper.classList.contains("active")) {
    this.setAttribute("aria-expanded", "false");
    this.setAttribute("aria-label", "menu");
    navWrapper.classList.remove("active");
    main.classList.remove("search_margin", "menu_margin");
  } else {
    navWrapper.classList.add("active");
    main.classList.add("menu_margin");
    this.setAttribute("aria-label", "close menu");
    this.setAttribute("aria-expanded", "true");
    searchForm.classList.remove("active");
    searchToggle.classList.remove("active");
  }
});

searchToggle.addEventListener("click", showSearch);

function showSearch() {
  searchForm.classList.toggle("active");
  searchToggle.classList.toggle("active");
  main.classList.add("search_margin");

  navToggle.setAttribute("aria-expanded", "false");
  navToggle.setAttribute("aria-label", "menu");
  navWrapper.classList.remove("active");
  main.classList.remove("menu_margin");

  if (searchToggle.classList.contains("active")) {
    searchToggle.setAttribute("aria-label", "Close search");
  } else {
    searchToggle.setAttribute("aria-label", "Open search");
    main.classList.remove("search_margin");
  }
}

window.addEventListener('resize', changeButtons);
window.addEventListener('turbolinks:visit', changeButtons);
window.addEventListener('load', changeButtons);

function changeButtons(){
  if (window.innerWidth < 540){
    document.querySelector(".kofi").getElementsByTagName("span")[0].innerHTML = "Ko-fi";
    document.querySelector(".patreon").getElementsByTagName("span")[0].innerHTML = "Patreon";
  }
  else {
    document.querySelector(".kofi").getElementsByTagName("span")[0].innerHTML = "Support me on Ko-fi";
    document.querySelector(".patreon").getElementsByTagName("span")[0].innerHTML = "Support me on Patreon"
  }
}
