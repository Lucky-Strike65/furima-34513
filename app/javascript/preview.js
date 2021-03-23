
if (document.URL.match( /new/ ) || document.URL.match( /edit/)){
  document.addEventListener('DOMContentLoaded',function(){
  const ImageList = document.getElementById('image-list');
  
  const createImageHTML = (blob) => {
    const imageElement = document.createElement('div');
    imageElement.setAttribute('class', "image-element")
    let imageElementNum = document.querySelectorAll('.image-element').length
    imageElement.setAttribute('data-index',`${imageElementNum}`)
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.id= "preview"


    const inputHTML = document.createElement('input')
    inputHTML.setAttribute('id', `message_image_${imageElementNum}`)
    inputHTML.setAttribute('name', 'item[images][]')
    inputHTML.setAttribute('type', 'file')


    const inputRemove = document.createElement('button')
    inputRemove.innerHTML = '削除' 
    inputRemove.addEventListener('click',(e)=>{
      e.preventDefault();
      inputRemove.previousElementSibling.remove();
      inputRemove.remove();
    });
    
  
  
  imageElement.appendChild(blobImage);
  imageElement.appendChild(inputHTML)
  ImageList.appendChild(imageElement);
  ImageList.appendChild(inputRemove)
  inputHTML.addEventListener('change', (e) => {
  file = e.target.files[0];
  blob = window.URL.createObjectURL(file);
  createImageHTML(blob)
  })
  };
  document.getElementById('item-image').addEventListener('change',(e) => {
  const file = e.target.files[0];
  const blob = window.URL.createObjectURL(file);
  createImageHTML(blob);
  ImageList.addEventListener
  });
  });
  }