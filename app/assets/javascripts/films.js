var NumElem;
var i=0;
var Commercials;

var spotTime = 4000; 
var interval;
var startingTime;

function switchVideo() {
  v.pause();
  v.style.display = 'none';
  a.style.display = 'block';
  a.src = Commercials[i].value;
  //a.load();
  // a.currentTime = 0.01;
  a.play();
}

function vPlay() {
  interval = window.setTimeout(switchVideo, spotTime);
  startingTime = new Date().getTime();
  v.play();
}

function aEnded(){
  //En este caso volvemos al video anterior por donde ibamos
  v.style.display = 'block';
  a.style.display = 'none';
  spotTime = 4000;
  v.play();
  i++;
  i = i%NumElem;
}


function vPause(){
  var tiempoPasado = new Date().getTime() - startingTime;
  clearInterval(interval);
  spotTime -= tiempoPasado;
}

function vEnded() {
  clearInterval(interval);
}
