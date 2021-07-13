document.addEventListener("DOMContentLoaded", function(){
	var FID = document.createElement("iframe");
	FID.src = "https://chart-embed.service.newrelic.com/herald/a3f53eff-e6a7-40e2-9be5-6760347a9a3d?height=300px&timepicker=true";
	FID.style.width = '300px';
	FID.style.height = '350px';
	FID.style.zIndex = '0';
	FID.style.position = 'relative';
	FID.scrolling = 'no';
	FID.style.border = 'none';

	var CLS = document.createElement("iframe");
	CLS.src = "https://chart-embed.service.newrelic.com/herald/a7d5c912-36ca-4021-9b4e-c903c995a493?height=300px&timepicker=true";
	CLS.style.width = '300px';
	CLS.style.height = '350px';
	CLS.style.zIndex = '0';
	CLS.style.position = 'relative';
	CLS.scrolling = 'no';
	CLS.style.border = 'none';

	var LCP = document.createElement("iframe");
	LCP.src = "https://chart-embed.service.newrelic.com/herald/f8389095-dd0c-435b-a80d-540645b96641?height=300px&timepicker=true";
	LCP.style.width = '300px';
	LCP.style.height = '350px';
	LCP.style.zIndex = '0';
	LCP.style.position = 'relative';
	LCP.scrolling = 'no';
	LCP.style.border = 'none';


	var Graph = document.createElement("iframe");
	Graph.src = "https://chart-embed.service.newrelic.com/herald/531ac35c-9a01-4f14-8476-34293f2fdce7?height=400px&timepicker=true";
	Graph.style.width = '100%';
	Graph.style.minWidth = '900px';
	Graph.style.height = '430px';
	Graph.style.zIndex = '0';
	Graph.style.position = 'relative';
	Graph.scrolling = 'no';
	Graph.style.border = 'none';

	var IDs = ["FID", "CLS", "LCP", "Graph"];
	if (document.getElementById("page_title").innerText == "Dashboard"){
		document.getElementById("main_content").classList.add("mine");
	}
	function disableElements(ID){
		var loading = document.getElementById(ID).querySelector(".loading");
		setTimeout(function(){
			loading.classList.add("disabled");
			loading.parentElement.querySelector(".tooltip").classList.remove("disabled");
			if (loading.parentElement.getElementsByTagName('div')[1].classList.contains("figcaption")){
				loading.parentElement.querySelector(".figcaption").classList.remove("disabled");
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
	document.querySelector('.first').addEventListener("click", function(){
		event.target.classList.toggle("active");
	});
});