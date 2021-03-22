function change()  {
  const imageSub = document.querySelectorAll('.item-box-img');
  const imageMain = document.getElementById('item-main')

  imageSub.forEach(function(item){
    item.onmouseover = function(){
      const imageSrc = item.getAttribute("src")
      imageMain.src = imageSrc;
      
    }
  })
}



window.addEventListener('load', change)