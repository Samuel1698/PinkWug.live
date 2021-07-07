var toggle = document.querySelector(".toggle");
var line   = document.querySelector(".div");
var table  = document.querySelector(".table");
var rows   = document.querySelectorAll(".row");

function galleryToggle(state){
	return function(){
		if (table.classList.contains("gallery") && !state){ //If gallery view is on, toggle off
		  line.classList.add("line");
		  toggle.classList.remove("gallery");
		  toggle.firstElementChild.innerHTML = 'Toggle Gallery View';
			table.classList.remove("gallery");
			for (let i = 0; i < rows.length; i++){
				rows[i].classList.remove("gallery");
			}
		}
		// If gallery view is off, turn on
		// if state is declared AND viewWidth <= 700px, OR table doesnt contain "gallery" and State is not declared
		else if ((!table.classList.contains("gallery") && !state) || (state == true && window.innerWidth <= 700)) {
			console.log("Resize, load or turbolinksload: " + state);
			line.classList.remove("line");
			table.classList.add("gallery");
			toggle.classList.add("gallery");
			toggle.firstElementChild.innerHTML = 'Toggle Line View';
			for (let i = 0; i < rows.length; i++){
				rows[i].classList.add("gallery");
			}
		}
	}
}
toggle.addEventListener("click", galleryToggle());
window.addEventListener('resize', galleryToggle(true));
document.addEventListener('turbolinks:load', galleryToggle(true));
toggle.addEventListener("click", addWhiteSpace("click"));

// Sorts the array based on the array key "property"
function dynamicSort(property, state){
	var sortOrder = 1;
	if (state == "asc")
		sortOrder = -1
	return function (a,b){
		if (property == "stTitle")
			var result = (a[property].toLowerCase() < b[property].toLowerCase() ? 1 : - 1);
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
		// If the title/date doesnt contain ASCending, do that order
		// Default title doesnt contain either ASC nor DESC
		// As the default order is by DESC Date
		if      (!this.classList.contains("asc")){ 
			title.classList.remove("desc"); 
			date.classList.remove("desc"); 
			this.classList.add("asc");
			sortExceptF(cell, property, "asc");
		}
		// If the title doesnt contain DESCending, do that order
		else if (!this.classList.contains("desc")){ 
			title.classList.remove("asc");
			date.classList.remove("asc"); 
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