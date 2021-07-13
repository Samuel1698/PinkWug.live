var buttons = document.querySelectorAll(".collection_button");

for (var i=0;i < buttons.length;i++){
	buttons[i].addEventListener("click", dropDown());
}

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