/*================================================================================
	Item Name: Materialize - Material Design Admin Template
	Version: 3.1
	Author: GeeksLabs
	Author URL: http://www.themeforest.net/user/geekslabs
================================================================================

NOTE:
------
PLACE HERE YOUR OWN JS CODES AND IF NEEDED.
WE WILL RELEASE FUTURE UPDATES SO IN ORDER TO NOT OVERWRITE YOUR CUSTOM SCRIPT IT'S BETTER LIKE THIS. */

$( document ).on('turbolinks:load', function() {
    $('.tooltipped').tooltip({delay: 50});
    var path_name=window.location.pathname.toString();
    var res = path_name.split("/");
    /* multiple automplete tipo de uso in medicamentos */
   if ( (res[1]=="medicamento" && res[res.length-1]=="new") || (res[1]=="medicamento" && res[res.length-1]=="edit") ){
     var tipoUso = new Bloodhound({
         datumTokenizer : Bloodhound.tokenizers.obj.whitespace("id","tipo_uso"),
         queryTokenizer : Bloodhound.tokenizers.whitespace,
         remote: '../../grupo_medicamento/index/'
     });
     tipoUso.initialize();
     elt = $('#tipoUso');
     elt.materialtags({
         itemValue   : 'id',
         itemText    : 'tipo_uso',
         typeaheadjs : {
             name       : 'tipoUso',
             displayKey : 'tipo_uso',
             source: tipoUso.ttAdapter()
         }
     });
     if ($('#medicamento_id').val()!=''){
       $.getJSON("../../grupo_medicamento/find_by_id",{ tipo_uso_ids: $('#tipo_uso_ids').val()}, function(resuslt){
         $.each(resuslt, function(i, element){
             elt.materialtags('add', {"id" : element.id , "tipo_uso" : element.tipo_uso });
         });
       });
     }
     elt.on('change', function (event) {
        var $element   = $(event.target);
        if (!$element.data('materialtags')) {
            return;
        }
        var val = $element.val();
        if (val === null){
            val = "null";
        }
        $('#tipo_uso_ids').val(($.isArray(val) ? JSON.stringify(val) : val.replace('"', '\\"') ))
     }).trigger('change');
   }else{
     if ( (res[1]=="user" && res[res.length-1]=="new") || (res[1]=="user" && res[res.length-1]=="edit") ){
       /* autocomplete empleado in user*/
       var empleado = new Bloodhound({
           datumTokenizer : Bloodhound.tokenizers.obj.whitespace("id","nombre"),
           queryTokenizer : Bloodhound.tokenizers.whitespace,
           remote: '../../empleados/index/'
       });
       empleado.initialize();
       elt_emp = $('#empleado');
       elt_emp.materialtags({
           itemValue   : 'id',
           itemText    : 'nombre',
           typeaheadjs : {
               name       : 'empleado',
               displayKey : 'nombre',
               source: empleado.ttAdapter()
           }
       });
       if ($('#user_id').val()!=''){
         $.getJSON("../../empleado/find_by_id",{ id: $('#empleado_id').val()}, function(element){
               elt_emp.materialtags('add', {"id" : element.id , "nombre" : element.nombre });
         });
       }
       elt_emp.on('change', function (event) {
          var $element   = $(event.target);
          if (!$element.data('materialtags')) {
              return;
          }
          var val = $element.val();
          if (val === null){
              val = "null";
          }
          $('#empleado_id').val(($.isArray(val) ? JSON.stringify(val) : val.replace('"', '\\"') ))
       }).trigger('change');
     }

     if ( (res[1]=="factura_venta" && res[res.length-1]=="new") || (res[1]=="factura_venta" && res[res.length-1]=="edit") ){
       /* autocomplete empleado in user*/
       var cliente = new Bloodhound({
           datumTokenizer : Bloodhound.tokenizers.obj.whitespace("id","nombre"),
           queryTokenizer : Bloodhound.tokenizers.whitespace,
           remote: '../../clientes/index/'
       });
       cliente.initialize();
       elt_cliente = $('#cliente');
       elt_cliente.materialtags({
           itemValue   : 'id',
           itemText    : 'nombre',
           typeaheadjs : {
               name       : 'cliente',
               displayKey : 'nombre',
               source: cliente.ttAdapter()
           }
       });
       if ($('#cliente_id').val()!=''){
         $.getJSON("../../cliente/find_by_id",{ id: $('#cliente_id').val()}, function(element){
               elt_cliente.materialtags('add', {"id" : element.id , "nombre" : element.nombre });
         });
       }
       elt_cliente.on('change', function (event) {
          var $element   = $(event.target);
          if (!$element.data('materialtags')) {
              return;
          }
          var val = $element.val();
          if (val === null){
              val = "null";
          }
          $('#cliente_id').val(($.isArray(val) ? JSON.stringify(val) : val.replace('"', '\\"') ))
       }).trigger('change');
     }
   }
   /* formateo de fechas */

   $('#fec_factura').formatter({
        'pattern': '{{99}}/{{99}}/{{9999}}',
   });

  /* detalle factura venta for ajax */
  $('#create_or_update').on("click", function() {

    $("#detalle_factura_venta_form").validate({
      rules: {
        "medicamento_id": {
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
        var _id= $("#detalle_factura_venta_id").val();
        var _medicamento_id =$("#medicamento_id").val();
        var _cantidad = $("#cantidad").val();;
        $.ajax({
            url: $(this).attr('ajax_path'),
            data: {"id":_id ,"medicamento_id":_medicamento_id,"cantidad":_cantidad},
            type:'POST',
            async: true,
            dataType: 'script'
         });
            return false;
      }
    });

   });
});

/* angular js */

//var app = angular.module('pharmacyApp', []);
/*app.controller('timbradoCtrl', function($scope){
	$scope.hello='Hola';
	 $scope.change = function() {
	 	window.alert();
	    $scope.sayHello = 'Hello';
	  }
});*/
 function timbradoChange(item){
    $('#timbrado_show').attr('href','/timbrado/'+item.value+'/show');
}
