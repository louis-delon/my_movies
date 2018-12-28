function previewFile(){
      var preview = document.querySelector('.photo'); //selects the query named img
      var file    = document.querySelector('input[type=file]').files[0];
      console.log(file) //sames as here
      var reader  = new FileReader();

      reader.onloadend = function () {
         preview.src = reader.result;
      }

      if (file) {
        reader.readAsDataURL(file); //reads the data as a URL
      } else {
        preview.src = "";
      }
    }
    previewFile();
