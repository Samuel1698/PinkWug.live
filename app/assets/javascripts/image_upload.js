document.addEventListener("DOMContentLoaded", function(){
  if (document.getElementById("page_title").innerText == "Edit Strip" || document.getElementById("page_title").innerText == "New Strip"){
    // where files are dropped + file selector is opened
    var dropRegion = document.getElementById("drop-region");
    // where images are previewed
    var imagePreviewRegion = document.getElementById("image-preview");
    // ActiveAdmin's input form
    var realInput = document.getElementById("strip_image");

    var img = document.querySelector(".image-element");

    // Preview for 'edit strip'
    if (img.classList.contains("edit")){
      dropRegion.classList.add("preview");
    }
    else {
      imagePreviewRegion.classList.add("hidden");
    }
    // Inline error for image drop region
    if (realInput.parentElement.parentElement.classList.contains("error")){
      dropRegion.classList.add("error");
      var p = document.createElement("p");
      p.className = "inline-errors";
      p.textContent = "can't be blank";
      dropRegion.parentElement.appendChild(p)
    }

    // Mimic click of the real input field
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

    // Prevent default drag & drop behavior of opening file on window on the entire document
    document.addEventListener('dragenter', preventDefault, false)
    document.addEventListener('dragleave', preventDefault, false)
    document.addEventListener('dragover', preventDefault, false)
    document.addEventListener('drop', preventDefault, false)

    // Handle the files and assign them to the real input
    function handleDrop(e) {
      var dt = e.dataTransfer,
          files = dt.files;
      realInput.files = files;
      handleFiles(files);
    }
    dropRegion.addEventListener('drop', handleDrop, false);

    // Makes sure only one field gets submitted and is a valid image
    function handleFiles(files) {
      if (files.length > 1) {
        alert("Too Many Files");
      }
      else if (validateImage(files[0])) {
        previewAnduploadImage(files[0]);
      }
    }
    // Makes sure image file is correct type and not too big
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
    // Previews the image upon upload
    function previewAnduploadImage(image) {
      // remove the hidden attribute of the img div
      imagePreviewRegion.classList.remove("hidden");
      // read the image...
      var reader = new FileReader();
      reader.onload = function(e) {
        img.src = e.target.result;
      }
      reader.readAsDataURL(image);

      // Add class to parent element that image is displayed 
      dropRegion.classList.add("preview")
    }
    // Detect if drag & drop is supported, if not change the message
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
