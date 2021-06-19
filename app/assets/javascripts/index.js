var toggle        = document.querySelector(".toggle");
var line          = document.querySelector(".div");
var table         = document.querySelector(".table");
var rows          = document.querySelectorAll(".row");

toggle.addEventListener("click", gallery);

function gallery(){
	if (table.classList.contains("gallery")){ //If gallery view is on, toggle off
	  line.classList.add("line");
	  toggle.classList.remove("gallery");
		table.classList.remove("gallery");
		for (i = 0; i < rows.length; i++){
			rows[i].classList.remove("gallery");
		}
	}
	else {                                   //If gallery view is off, toggle on
		line.classList.remove("line");
		table.classList.add("gallery");
		toggle.classList.add("gallery");
		for (i = 0; i < rows.length; i++){
			rows[i].classList.add("gallery");
		}
	}
};

window.addEventListener('resize', removeToggle);
window.addEventListener('turbolinks:visit', removeToggle);
window.addEventListener('load', removeToggle);

function removeToggle(){
	toggle.classList.remove("hidden");
	if (window.innerWidth <= 700) {
		toggle.classList.add("hidden");
		line.classList.remove("line");
		table.classList.add("gallery");
		toggle.classList.add("gallery");
		for (i = 0; i < rows.length; i++){
			rows[i].classList.add("gallery");
		}
	}
}
