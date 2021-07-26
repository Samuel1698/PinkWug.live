function preloadImages(a, i){
  if (document.getElementById){
    for (let j = 0; j + i < a.length + i; j++){
      offset = j + i;
      var aId = "preload-0" + offset;
      document.getElementById(aId).style.background = `url(${a[j]}) no-repeat -9999px -9999px`;
    }
  }
}
