var current_strip  = window.location.pathname; 
var first_strip    = document.querySelector(".fa-angle-double-left");
var previous_strip = document.querySelector(".fa-angle-left");
var next_strip     = document.querySelector(".fa-angle-right");
var last_strip     = document.querySelector(".fa-angle-double-right");
var backwardsDiv   = document.querySelector(".backwards").parentElement;
var forwardDiv     = document.querySelector(".forward").parentElement;


if (first_strip.pathname == current_strip) {
  first_strip.querySelector(".visually-hidden").remove();
  first_strip.removeAttribute('href');
  first_strip.classList.add("disabled");
}
if (previous_strip.pathname == current_strip) {
  previous_strip.querySelector(".visually-hidden").remove();
  previous_strip.removeAttribute('href');
  previous_strip.classList.add("disabled");
  backwardsDiv.removeAttribute('href');
  backwardsDiv.classList.add("disabled");
}
if (next_strip.pathname == current_strip || location.pathname == "/") {
  next_strip.querySelector(".visually-hidden").remove();
  next_strip.removeAttribute('href');
  next_strip.classList.add("disabled");
  forwardDiv.removeAttribute('href');
  forwardDiv.classList.add("disabled");
}
if (last_strip.pathname == current_strip || location.pathname == "/") {
  last_strip.querySelector(".visually-hidden").remove();
  last_strip.removeAttribute('href');
  last_strip.classList.add("disabled");
}

// --------------------------------------------------
// Tooltip
// --------------------------------------------------

var tooltip = document.querySelector('.tooltip');
tooltip.addEventListener("keyup", hitEnter);

function hitEnter(){
  if (event.keyCode === 13) {
    event.preventDefault();
    document.querySelector('.tooltip').click();
  }
}

function updateClipboard(newClip) {
  window.Clipboard = (function(window, document, navigator) {
    var textArea,
      copy;

    function isOS() {
      return navigator.userAgent.match(/ipad|iphone/i);
    }

    function createTextArea(text) {
      textArea = document.createElement('textArea');
      textArea.value = text;
      document.body.appendChild(textArea);
    }

    function selectText() {
      var range,
          selection;

      if (isOS()) {
        range = document.createRange();
        range.selectNodeContents(textArea);
        selection = window.getSelection();
        selection.removeAllRanges();
        selection.addRange(range);
        textArea.setSelectionRange(0, 999999);
      } else {
        textArea.select();
      }
    }

    function copyToClipboard() {        
      document.execCommand('copy');
      document.body.removeChild(textArea);
    }

    copy = function(text) {
      createTextArea(text);
      selectText();
      copyToClipboard();
    };
    tooltip.firstElementChild.innerHTML = 'link copied';
    tooltip.classList.add("active");  
    return {
      copy: copy
    };
  })(window, document, navigator);
  // navigator.clipboard.writeText(newClip).then(function() {
  //   /* clipboard successfully set */
  //   tooltip.firstElementChild.innerHTML = 'link copied';
  //   tooltip.classList.add("active");    
  // }, function() {
  //   /* clipboard write failed */
  //   tooltip.firstElementChild.innerHTML =  'copy failed';   
  // });
  Clipboard.copy(newClip);
  setTimeout(function(){
    tooltip.firstElementChild.innerHTML = 'copy link';
    tooltip.classList.remove("active");
  }, 2500);
}
// --------------------------------------------------
// Height of parent
// --------------------------------------------------
function resetHeight() {
  document.querySelector('.parent').style.minHeight = 0;
}
