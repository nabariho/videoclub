var NumElem;
var i=0;
var Commercials;
//var EnAnuncio = new Boolean(false);

function switchVideo(){
  v.pause();
  v.style.display = 'none';
  a.style.display = 'block';
  var interval; 
  spotTime = 240000;
  a.src=Commercials[i].value;
  a.load();
  a.play();
}

function finAnuncio(){
   //En este caso volvemos al video anterior por donde ibamos
   v.style.display = 'block';
   a.style.display = 'none';
   v.play();
   i++;
   i=i%NumElem;
}
function paraArranca(){
  parada = interval;
  clearInterval(interval);
  spotTime = spotTime - parada;
}
