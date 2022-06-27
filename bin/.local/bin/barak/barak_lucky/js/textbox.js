function limitInput(inputVal) {
  var patt=/^[a-zA-Z0-9, ]+$/;
  if(patt.test(inputVal)){
    document.getElementById('search').value = inputVal;
  }
  else{
    var txt = inputVal.slice(0, -1);
    document.getElementById('search').value = txt;
  }
}
