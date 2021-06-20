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
// Sorts the array based on the array key "property"
function dynamicSort(property, state){
	var sortOrder = 1;
	if (state == "desc")
		sortOrder = -1
	return function (a,b){
		if (property == "stTitle")
			var result = (a[property].toLowerCase() < b[property].toLowerCase() ? - 1 : (a[property].toLowerCase() > b[property].toLowerCase()) ? 1: 0);
		if (property == "stDate")
			var result = (new Date(b[property]) - new Date(a[property]));
		return result * sortOrder;
	}
}
// Removes the first element of the array of objects
// Sorts the array of objects(list) through dynamicSort
// Inserts the first element back to place
function sortExceptF(list, property, state){
	let temp = list[0];
	list.shift();
	list.sort(dynamicSort(property, state))
	list.unshift(temp);
	return 0;
}

var title = document.querySelector(".title");
var date  = document.querySelector(".date");
title.addEventListener("click", switchRows("stTitle")); 
date.addEventListener("click", switchRows("stDate")); 

	function switchRows(property){
		return function(){
			//First elements are the table head, ignored from the sorting
			var cell = [{stImage: "none",stTitle: "none",stDate: "none"}]; 
			for(let i = 1; i < (rows.length); i++){
				cell.push({
					stImage: rows[i].getElementsByClassName("cell")[0].src,
					stTitle: rows[i].getElementsByClassName("cell")[1].innerHTML,
					stDate:  rows[i].getElementsByClassName("cell")[2].innerHTML,
				})
			}
			// If the title doesnt contain ASCending, do that order
			// Default element doesnt contain either ASC nor DESC
			// As the default order is by ID (should match date)
			if      (!this.classList.contains("asc")){ 
				this.classList.remove("desc"); // Use these classes for styling the button
				this.classList.add("asc");
				sortExceptF(cell, property, "asc");
			}
			// If the title doesnt contain DESCending, do that order
			else if (!this.classList.contains("desc")){ 
				this.classList.remove("asc");
				this.classList.add("desc");
				sortExceptF(cell, property, "desc");
			}
			// Change the values of all key:value pairs according to new order
			for(let i = 1; i < (rows.length); i++) {
				rows[i].getElementsByClassName("cell")[0].src       = cell[i].stImage; 
				rows[i].getElementsByClassName("cell")[1].innerHTML = cell[i].stTitle; 
				rows[i].getElementsByClassName("cell")[2].innerHTML = cell[i].stDate;
			}
		};
	}