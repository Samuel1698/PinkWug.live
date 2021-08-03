document.addEventListener("DOMContentLoaded", function(){
  if (document.getElementById("page_title").innerText == "Dashboard"){
    document.getElementById("active_admin_content").classList.add("mine");
  }
});