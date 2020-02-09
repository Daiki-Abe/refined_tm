const timer = document.getElementById("timer");
const start = document.getElementById("start");

// 経過時間を保存する変数（単位:ミリ秒）
let elapsedTime;
// スタートボタンを押したときのUnix Epoch
let startTime;
// タイマーのID
let timerId;
// 以前 stop したタイミングまでの計測時間
let timeToAdd = 0;

// 表示される内容をアップデートする関数
const updateTimeText = () => {
  // 1時間 = 1000 ミリ秒 * 60秒 * 60分
  let h = Math.floor(elapsedTime / (1000 * 60 * 60))
  // 1分 = 1000 ミリ秒 * 60秒
  let m = Math.floor(elapsedTime / (1000 * 60));
  // 1分に満たなかったミリ秒のうち，秒となったもの
  let s = Math.floor((elapsedTime % (1000 * 60)) / 1000);
  // 1秒になれなかったもの
  let ms = elapsedTime % 1000;

  h = `0${h}`.slice(-2);
  m = `0${m}`.slice(-2);
  s = `0${s}`.slice(-2);
  ms = `00${ms}`.slice(-3);

  timer.textContent = `${h}：${m}：${s}`;
};

// 経過時間の管理と計算を行う関数
const countUp = () => {
  timerId = setTimeout(() => {
    elapsedTime = Date.now() - startTime + timeToAdd;
    updateTimeText();
    //countUp関数自身を呼ぶことで10ミリ秒毎に計算を始める
    countUp();
  }, 10);
};

// 時間表記（開始時間と終了時間）を２桁にする関数
function set2fig(num){
  let ret;
  if(num < 10) {ret = "0" + num;}
  else {ret = num;}
  return ret;
}

start.addEventListener("click", () => {
  startTime = Date.now();
  countUp();
  // スタートボタンを無効化
  start.disabled = true;
  // スタートした時間を取得
  let whenTime = new Date()
  let hour = set2fig(whenTime.getHours());
  let minute = set2fig(whenTime.getMinutes());
  $('#start__time').val(hour + ":" + minute);
});

$('form').submit(function() {
  clearTimeout(timerId);
  timeToAdd += Date.now() - startTime;
  // スタートボタンを有効化
  start.disabled = false;
  const score = timer.textContent
  $('#score').val(score);
  // 終了した時間を取得
  let whenTime = new Date()
  let hour = set2fig(whenTime.getHours());
  let minute = set2fig(whenTime.getMinutes());
  $('#end__time').val(hour + ":" + minute);
});

