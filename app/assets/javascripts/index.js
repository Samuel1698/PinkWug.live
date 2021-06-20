var toggle        = document.querySelector(".toggle");
var line          = document.querySelector(".div");
var table         = document.querySelector(".table");
var rows          = document.querySelectorAll(".row");

toggle.addEventListener("click", function(){
	if (table.classList.contains("gallery")){ //If gallery view is on, toggle off
	  line.classList.add("line");
	  toggle.classList.remove("gallery");
		table.classList.remove("gallery");
		for (let i = 0; i < rows.length; i++){
			rows[i].classList.remove("gallery");
		}
	}
	else {                                   //If gallery view is off, toggle on
		line.classList.remove("line");
		table.classList.add("gallery");
		toggle.classList.add("gallery");
		for (let i = 0; i < rows.length; i++){
			rows[i].classList.add("gallery");
		}
	}
});

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
function sortExceptF(list){
	let temp = list[0].stTitle;
	list.shift();
	list.sort((a, b) => (a.stTitle.replace(/\s+/g, '').substring(0, 4).toLowerCase() > b.stTitle.replace(/\s+/g, '').substring(0, 4).toLowerCase()) ? 1 : -1);
	list.unshift(temp);
	 
	return 0;
}

var title = document.querySelector(".title");
title.addEventListener("click", function(){
	var cell = [
		{
			stImage: "none",
			stTitle: "none",
			stDate:  "none", 
		},
	];
	for(let i = 1; i < (rows.length); i++){
		cell.push({
			stImage: rows[i].getElementsByClassName("cell")[0].src,
			stTitle: rows[i].getElementsByClassName("cell")[1].innerHTML,
			stDate:  rows[i].getElementsByClassName("cell")[2].innerHTML,
		})
	}
	sortExceptF(cell);
	for(let i = 1; i < (rows.length); i++) {
		rows[i].getElementsByClassName("cell")[0].src       = cell[i].stImage; 
		rows[i].getElementsByClassName("cell")[1].innerHTML = cell[i].stTitle; 
		rows[i].getElementsByClassName("cell")[2].innerHTML = cell[i].stDate;
	}
});
