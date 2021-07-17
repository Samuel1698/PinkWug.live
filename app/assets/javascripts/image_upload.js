document.addEventListener("DOMContentLoaded", function(){
  if (document.getElementById("page_title").innerText == "Edit Strip" || document.getElementById("page_title").innerText == "New Strip"){
    // where files are dropped + file selector is opened
    var dropRegion = document.getElementById("drop-region");
    // where images are previewed
    var imagePreviewRegion = document.getElementById("image-preview");
    // ActiveAdmin's input form
    var realInput = document.getElementById("strip_image");
    // Entire form page
    var mainContent = document.getElementById("main_content");

    var img = document.querySelector(".image-element");

    if (img.classList.contains("edit")){
      dropRegion.classList.add("preview")
    }

    dropRegion.addEventListener('click', function() {
      realInput.click();
    });
    realInput.addEventListener("change", function(){
      var files = realInput.files;
      handleFiles(files);
    })

    function preventDefault(e) {
      e.preventDefault();
      e.stopPropagation();
    }

    // Prevent default drag & drop behavior of opening file on window
    dropRegion.addEventListener('dragenter', preventDefault, false)
    dropRegion.addEventListener('dragleave', preventDefault, false)
    dropRegion.addEventListener('dragover', preventDefault, false)
    dropRegion.addEventListener('drop', preventDefault, false)
    // Prevent it for the entire screen
    mainContent.addEventListener('dragenter', preventDefault, false)
    mainContent.addEventListener('dragleave', preventDefault, false)
    mainContent.addEventListener('dragover', preventDefault, false)
    mainContent.addEventListener('drop', preventDefault, false)

    function handleDrop(e) {
      var dt = e.dataTransfer,
          files = dt.files;
      handleFiles(files)
    }
    dropRegion.addEventListener('drop', handleDrop, false);

    function handleFiles(files) {
      if (files.length > 1) {
        alert("Too Many Files");
      }
      else if (validateImage(files[0])) {
        previewAnduploadImage(files[0]);
      }
    }
    function validateImage(image) {
      // check the type
      var validTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg'];
      if (validTypes.indexOf(image.type) === -1) {
        alert("Invalid File Type");
        return false;
      }
      // check the size
      var maxSizeInBytes = 10e6; // 10MB
      if (image.size > maxSizeInBytes) {
        alert("File too large");
        return false;
      }
      return true;
    }
    function previewAnduploadImage(image) {
      // Select the image element 
      // read the image...
      var reader = new FileReader();
      reader.onload = function(e) {
        img.src = e.target.result;
      }
      reader.readAsDataURL(image);

      // Add class to parent element that image is displayed 
      dropRegion.classList.add("preview")
    }
    function detectDragDrop() {
      var div = document.createElement('div');
      return ('draggable' in div) || ('ondragstart' in div && 'ondrop' in div)
    }
    // change the message
    var dragSupported = detectDragDrop();
    if (!dragSupported) {
      document.getElementsByClassName("drop-message")[0].innerHTML = 'Click to upload';
    }
  }
});
