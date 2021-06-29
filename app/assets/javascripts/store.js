var mugs     = document.getElementById('mugs');
var clothes  = document.getElementById('clothes');
var stickers = document.getElementById('stickers');
var prints   = document.getElementById('prints');

mugs.addEventListener("click", dropDown(), false);
clothes.addEventListener("click", dropDown(), false);
stickers.addEventListener("click", dropDown(), false);
prints.addEventListener("click", dropDown(), false);

function dropDown(){
	return function(){
		collection = this.parentNode.querySelector('.collection')
		if (collection.classList.contains("inactive")){ //If it's inactive, make active
			this.classList.remove("asc");
			collection.classList.remove("inactive");
		}
		else {
			this.classList.add("asc");
			collection.classList.add("inactive");
		}
		addWhiteSpace("button click")();
	}
}