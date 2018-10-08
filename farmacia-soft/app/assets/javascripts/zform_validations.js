/*function myInit() {
   $("#detalle_factura_venta_form").validate({
     rules: {
       "umedicamento_id": {
         required: true
       },
       "cantidad": {
         required: true
       }
     },
     messages: {
       "medicamento_id": {
         required: "El campo no puede estar vacio"
         },
       "cantidad": {
         required: "El campo no puede estar vacio"

       },
     },
     errorPlacement: function(error, element) {
       document.getElementById(element.attr("id")).setCustomValidity("wrong");
       $($("label[for=" +element.attr("id") +"]")[0]).attr("data-error",error.text());
     },
     success: function(label, element){
       document.getElementById($(element).attr("id")).setCustomValidity("");
     }
   });
 }*/
