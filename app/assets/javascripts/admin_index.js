document.addEventListener("DOMContentLoaded", function(){
  var tools    = document.querySelector(".table_tools");
  var dropdown = document.querySelector(".dropdown_menu_button");
  var checkbox = document.querySelectorAll(".collection_selection");
  tools.classList.add("disabled");
  if (checked() == true){
    tools.classList.remove("disabled");
    dropdown.classList.remove("disabled");
  }
  function checked(){
    let check = false;
    for (let i = 0; i < checkbox.length; i++){
      if (checkbox[i].checked) {
        check = true;
      }
    }
    return check
  }
  document.getElementById("main_content").addEventListener("change", function(){
    // When button is clicked, if it's disabled, will toggle off
    if (dropdown.classList.contains("disabled")){
      tools.classList.remove("disabled");
    }
    // When button is clicked, check if it's not disabled, then loop through checkboxes
    else if (!dropdown.classList.contains("disabled") && checked() == false){
      tools.classList.add("disabled");
    }
  });
})
