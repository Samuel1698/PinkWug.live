let h_hand = document.querySelector(".hour");
let m_hand = document.querySelector(".minute");

function startTime(){
  setClock();
  setInterval(function() {
    setClock();
  }, 30000);
}

function setClock(){
  let today = new Date();
  let h = today.getHours();
  let m = today.getMinutes();

  h_degrees = h * 15; //360 % 24
  m_degrees = m * 6;  //360 % 60 

  h_hand.style.transform = `rotate(${h_degrees}deg)`;
  m_hand.style.transform = `rotate(${m_degrees}deg)`;
}