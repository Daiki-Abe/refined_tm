const timer = document.getElementById("timer");
const start = document.getElementById("start");

let elapsedTime;
let startTime;
let timerId;
let timeToAdd = 0;

const updateTimeText = () => {
  let h = Math.floor(elapsedTime / (1000 * 60 * 60))
  let m = Math.floor(elapsedTime / (1000 * 60));
  let s = Math.floor((elapsedTime % (1000 * 60)) / 1000);
  let ms = elapsedTime % 1000;

  h = `0${h}`.slice(-2);
  m = `0${m}`.slice(-2);
  s = `0${s}`.slice(-2);
  ms = `00${ms}`.slice(-3);

  timer.textContent = `${h}：${m}：${s}`;
};

const countUp = () => {
  timerId = setTimeout(() => {
    elapsedTime = Date.now() - startTime + timeToAdd;
    updateTimeText();
    countUp();
  }, 10);
};

function set2fig(num){
  let ret;
  if(num < 10) {ret = "0" + num;}
  else {ret = num;}
  return ret;
}

start.addEventListener("click", () => {
  startTime = Date.now();
  countUp();
  start.disabled = true;
  let whenTime = new Date()
  let hour = set2fig(whenTime.getHours());
  let minute = set2fig(whenTime.getMinutes());
  $('#start__time').val(hour + ":" + minute);
});

$('form').submit(function() {
  clearTimeout(timerId);
  timeToAdd += Date.now() - startTime;
  start.disabled = false;
  const score = timer.textContent
  $('#score').val(score);
  let whenTime = new Date()
  let hour = set2fig(whenTime.getHours());
  let minute = set2fig(whenTime.getMinutes());
  $('#end__time').val(hour + ":" + minute);
});

