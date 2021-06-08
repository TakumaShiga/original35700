document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('tweet_image')){
  const ImageList = document.getElementById("image-list");


  const createImageHTML = (blob) => {
    const imageElement = document.createElement('div');
    imageElement.setAttribute('class', "image-element")
    let imageElementNum = document.querySelectorAll('.image-element').length

    const blobImage = document.createElement('img')
    blobImage.setAttribute('src', blob)

    const inputHTML = document.createElement('input')
    inputHTML.setAttribute('id', `tweet_image_${imageElementNum}`)
    inputHTML.setAttribute('name', 'tweet[images][]')
    inputHTML.setAttribute('type', 'file')

    imageElement.appendChild(blobImage)
    imageElement.appendChild(inputHTML)
    ImageList.appendChild(imageElement)

    inputHTML.addEventListener('change', (e) => {
      file = e.target.files[0];
      blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    })
  }

  document.getElementById('tweet_image').addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
  });
  }
});