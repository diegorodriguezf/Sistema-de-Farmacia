
$('#new_user').validate({
        rules: {
            'user[username]': {
                required: true,
                minlength: 8
            },
           
            'user[password]': {
				required: true,
				minlength: 8
			},
        },
        //For custom messages
        messages: {
            'user[username]':{
                required: "El campo no puede estar vacio",
                minlength: "El campo debe contener como minimo 8 caracteres"
            },
            'user[password]':{
                required: "El campo no puede estar vacio",
                minlength: "El campo debe contener como minimo 8 caracteres"
            },
        },
        errorElement : 'div',
        errorPlacement: function(error, element) {
          var placement = $(element).data('error');
          if (placement) {
            $(placement).append(error)
          } else {
            error.insertAfter(element);
          }
        }
     });
     