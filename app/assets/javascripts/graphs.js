var iframe = document.querySelector(".column").createElement("iframe");
iframe.src = "https://chart-embed.service.newrelic.com/herald/3aa18aba-87c3-45dc-ad6b-5584a2ecad29?height=300px&timepicker=true";

if (iframe.addEventListener){
    iframe.addEventListener("load", function(){
        console.log("Local iframe is now loaded.");
    });
} 
else {
    iframe.load = function(){
        console.log("Local iframe is now loaded.");
    };
}

document.body.appendChild(iframe);