 $(document).on("turbolinks:load", function(){ 
    $().ready(function() {
        $.validator.addMethod("regex",function (value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Please check your input."
    );
    $('#login-form').validate({

            rules: {
                'username': {
                    required: true,
                    minlength: 8
                },
               
                'password': {
                    required: true,
                    minlength: 8
                },
            },
            //For custom messages
            messages: {
                'username':{
                    required: "El campo no puede estar vacio",
                    minlength: "El campo debe contener como minimo 8 caracteres"
                },
                'password':{
                    required: "El campo no puede estar vacio",
                    minlength: "El campo debe contener como minimo 8 caracteres"
                },
            }  ,
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
    });
}); 