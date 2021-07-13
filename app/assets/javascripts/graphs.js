document.addEventListener("DOMContentLoaded", function(){
	var FID = document.createElement("iframe");
	FID.src = "https://chart-embed.service.newrelic.com/herald/9879c337-03f7-49d6-9085-cad9431d31cd?height=300px&timepicker=true";
	FID.style.width = '330px';
	FID.style.minWidth = '330px';
	FID.style.height = '330px';
	FID.scrolling = 'no';
	FID.style.border = 'none';

	var CLS = document.createElement("iframe");
	CLS.src = "https://chart-embed.service.newrelic.com/herald/5c054812-6512-4a62-8e34-acfd694f4d3a?height=300px&timepicker=true";
	CLS.style.width = '330px';
	CLS.style.minWidth = '330px';
	CLS.style.height = '330px';
	CLS.scrolling = 'no';
	CLS.style.border = 'none';

	var LCP = document.createElement("iframe");
	LCP.src = "https://chart-embed.service.newrelic.com/herald/93dcf229-8057-4226-a7c7-6bfa96159fe1?height=300px&timepicker=true";
	LCP.style.width = '100%';
	LCP.style.minWidth = '330px';
	LCP.style.height = '330px';
	LCP.scrolling = 'no';
	LCP.style.border = 'none';


	var Graph = document.createElement("iframe");
	Graph.src = "https://chart-embed.service.newrelic.com/herald/531ac35c-9a01-4f14-8476-34293f2fdce7?height=400px&timepicker=true";
	Graph.style.width = '100%';
	Graph.style.minWidth = '990px';
	Graph.style.height = '430px';
	Graph.scrolling = 'no';
	Graph.style.border = 'none';

	var IDs = ["FID", "CLS", "LCP", "Graph"];

	function disableElements(ID){
		var loading = document.getElementById(ID).querySelector(".loading");
		setTimeout(function(){
			loading.classList.add("disabled");
			loading.parentElement.querySelector(".tooltip").classList.remove("disabled");
			if (loading.parentElement.getElementsByTagName('div')[1].classList.contains("figcaption")){
				loading.parentElement.querySelector(".figcaption").classList.remove("disabled");
			}
			if (ID == "FID"){
				loading.parentElement.querySelector(".ms").classList.remove("disabled");
			}
			if (ID == "LCP"){
				loading.parentElement.querySelector(".sec").classList.remove("disabled");
			}
		}, 4000);
	}
	for (var i=0; i < IDs.length; i++){
		if (IDs[i].addEventListener){
			IDs[i].addEventListener("DOMContentLoaded", disableElements(IDs[i]));
		} 
		else {
		  IDs[i].DOMContentLoaded = disableElements(IDs[i]);
		}
		document.getElementById(IDs[i]).appendChild(eval(IDs[i]));
	}
});