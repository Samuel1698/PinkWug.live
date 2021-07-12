document.addEventListener("DOMContentLoaded", function(){
	var iframeFID = document.createElement("iframe");
	iframeFID.src = "https://chart-embed.service.newrelic.com/herald/302267e8-0d10-4427-96cb-62b4bce2d559?height=300px&timepicker=true";
	iframeFID.style.width = '330px';
	iframeFID.style.minWidth = '330px';
	iframeFID.style.height = '330px';
	iframeFID.scrolling = 'no';
	iframeFID.style.border = 'none';

	var iframeMemory = document.createElement("iframe");
	iframeMemory.src = "https://chart-embed.service.newrelic.com/herald/3aa18aba-87c3-45dc-ad6b-5584a2ecad29?height=300px&timepicker=true";
	iframeMemory.style.width = '100%';
	iframeMemory.style.minWidth = '330px';
	iframeMemory.style.height = '330px';
	iframeMemory.scrolling = 'no';
	iframeMemory.style.border = 'none';

	var iframeThreads = document.createElement("iframe");
	iframeThreads.src = "https://chart-embed.service.newrelic.com/herald/4cdf8f76-c88a-4352-a4cf-fa635d04fed1?height=300px&timepicker=true";
	iframeThreads.style.width = '100%';
	iframeThreads.style.minWidth = '330px';
	iframeThreads.style.height = '330px';
	iframeThreads.scrolling = 'no';
	iframeThreads.style.border = 'none';


	var iframeGraph = document.createElement("iframe");
	iframeGraph.src = "https://chart-embed.service.newrelic.com/herald/ffa81e86-5425-4f3b-83d5-259ea15cd8bb?height=400px&timepicker=true";
	iframeGraph.style.width = '100%';
	iframeGraph.style.minWidth = '990px';
	iframeGraph.style.height = '430px';
	iframeGraph.scrolling = 'no';
	iframeGraph.style.border = 'none';

	var loading = document.querySelectorAll(".loading");

	function disableElements(){
		setTimeout(function(){
			for (let i=0; i < loading.length;i++){
				loading[i].classList.add("disabled");
			}
			document.querySelector(".figcaption").classList.remove("disabled");
			document.querySelector(".ms").classList.remove("disabled");
		}, 2600);
	}

	if (iframeFID.addEventListener){
		iframeFID.addEventListener("load", disableElements());
	} 
	else {
	  iframeFID.load = disableElements();
	}
	document.getElementById("memory").appendChild(iframeMemory);
	document.getElementById("threads").appendChild(iframeThreads);
	document.getElementById("FID").appendChild(iframeFID);
	document.getElementById("graph").appendChild(iframeGraph);
});