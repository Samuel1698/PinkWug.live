function startTime(){
  let today = new Date();
  let h_hand = document.querySelector(".hour-hand");
  let m_hand = document.querySelector(".minu-hand");
  let h = today.getHours();
  let m = today.getMinutes();

  h_degrees = h * 60;
  m_degrees = m * 6;

  h_hand.style.transform = `rotate(${h_degrees}deg)`;
  m_hand.style.transform = `rotate(${m_degrees}deg)`;
  setInterval(function() {
    let today = new Date();

    let h = today.getHours();
    let m = today.getMinutes();

    h_degrees = h * 60;
    m_degrees = m * 6;

    console.log(h + ":" + m);
    h_hand.style.transform = `rotate(${h_degrees}deg)`;
    m_hand.style.transform = `rotate(${m_degrees}deg)`;
  }, 30000);
}
