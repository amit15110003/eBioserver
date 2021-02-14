	
const menu = document.querySelector(".menu");
let menuVisible = false;

const toggleMenu = command => {
  menu.style.display = command === "show" ? "block" : "none";
  menuVisible = !menuVisible;
};

const setPosition = ({ top, left }) =>
{
  menu.style.left = `${left}px`;
  menu.style.top = `${top}px`;
  toggleMenu("show");
};

document.getElementById('body').addEventListener("click", e =>{
	
	
	
	
	if(menuVisible)toggleMenu("hide");


});

document.getElementById('mytable').addEventListener("contextmenu", e => {e.preventDefault();
  const origin = {
    left: e.pageX,
    top: e.pageY
  };
  setPosition(origin);
  $('menu').on('click', 'tr',function() {
  var currow = $(this).closest('tr');
	var col1 = currow.find('td:eq(5)').text();
	alert("gh"+col1);
  });
  return false;
});
	
