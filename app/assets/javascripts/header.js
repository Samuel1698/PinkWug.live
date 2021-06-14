// =======================================================================
// Header
// =======================================================================
var navToggle = document.querySelector(".nav_toggle");
var navWrapper = document.querySelector(".nav_ul");
var content = document.querySelector(".content");

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

var searchToggle = document.querySelector(".search_toggle");
var searchForm = document.querySelector(".search_form");

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

