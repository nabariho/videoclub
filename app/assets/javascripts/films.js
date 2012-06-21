var AdOrigin;
var FilmTime;
var FilmOrigin;
var EnAnuncio = new Boolean(false);

function switchVideo(){
if (EnAnuncio==false){
  FilmTime = v.currentTime;
  v.src=AdOrigin;
  v.curentSrc=AdOrigin;
  v.load();
  v.play();
  EnAnuncio=true;
}
}

function finAnuncio(){
//Comprobamos si estaba reproduciendo un anuncio
if (EnAnuncio){
   //En este caso volvemos al video anterior por donde ibamos
   v.currentSrc = FilmOrigin;
   v.src = FilmOrigin;
   //v.load();
   v.currentTime= 10;
   document.write(v.currentTime)
   v.play();
   EnAnuncio=false;
}
else{
   return;
}

}
