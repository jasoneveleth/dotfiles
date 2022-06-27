window.onscroll = function() {niceScroll()};

var navbar = document.getElementById("navbar");
var sticky = "45";

function niceScroll() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("shadow");
  console.log("shaddow added to navbar");
  } else {
    navbar.classList.remove("shadow");
  console.log("shaddow removed from navbar");
  }
}

/*Iframe solution to reduce loading time before the base page loads
document.getElementById("url").onclick = function() {gotoURL("url")};

function gotoURL(url) {

document.getElementById("main")...

}
*/
