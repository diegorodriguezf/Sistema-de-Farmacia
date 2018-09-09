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
    /* multiple automplete tipo de uso */
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
       if (val === null)
       {
           val = "null";
       }
       $('#tipo_uso_ids').val(($.isArray(val) ? JSON.stringify(val) : val.replace('"', '\\"') ))

    }).trigger('change');
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
