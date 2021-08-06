// --------------------------------------------------
// Tooltip & Clipboard
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
  Clipboard.copy(newClip);
  setTimeout(function(){
    tooltip.firstElementChild.innerHTML = 'copy link';
    tooltip.classList.remove("active");
  }, 2500);
}
// --------------------------------------------------
// In-image comic navigation
// --------------------------------------------------
var previous_strip = document.querySelector(".prev");
var next_strip     = document.querySelector(".next");
var parent = document.querySelector('.parent');
parent.addEventListener("click", function(event){
  pos_x = event.offsetX ? (event.offsetX) : event.pageX - this.offsetLeft;
  pos_y = event.offsetY ? (event.offsetY) : event.pageY - this.offsetTop;
  middle = (parent.offsetWidth / 2);
  margin = (parent.offsetWidth * .07) / 2;
  if (pos_y > margin && pos_y < parent.offsetHeight - margin){
    if (pos_x > margin && pos_x < middle && previous_strip){
      previous_strip.click();
    }
    if (pos_x > middle && pos_x < parent.offsetWidth - margin && next_strip){
      next_strip.click();
    }
  }
});
// --------------------------------------------------
// check_webp_feature:
// 'feature' can be one of 'lossy', 'lossless', 'alpha' or 'animation'.
// 'callback(feature, isSupported)' will be passed back the detection result (in an asynchronous way!)
// --------------------------------------------------
function check_webp_feature(feature, callback) {
  var kTestImages = {
    lossy: "UklGRiIAAABXRUJQVlA4IBYAAAAwAQCdASoBAAEADsD+JaQAA3AAAAAA",
    lossless: "UklGRhoAAABXRUJQVlA4TA0AAAAvAAAAEAcQERGIiP4HAA==",
    alpha: "UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA==",
    animation: "UklGRlIAAABXRUJQVlA4WAoAAAASAAAAAAAAAAAAQU5JTQYAAAD/////AABBTk1GJgAAAAAAAAAAAAAAAAAAAGQAAABWUDhMDQAAAC8AAAAQBxAREYiI/gcA"
  };
  var img = new Image();
  img.onload = function () {
    var result = (img.width > 0) && (img.height > 0);
    callback(feature, result);
  };
  img.onerror = function () {
    callback(feature, false);
  };
  img.src = "data:image/webp;base64," + kTestImages[feature];
  img.alt = "pinkwug comic, pink wug";
}
check_webp_feature('lossy', function (feature, isSupported) {
  if (!isSupported) {
    document.querySelector("footer").classList.add("png");
  }
});