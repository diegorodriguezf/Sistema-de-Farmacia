﻿/*================================================================================
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
        datumTokenizer : Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer : Bloodhound.tokenizers.whitespace,
        remote: {
                url: '../grupo_medicamento/index/?term=',
                wildcard: '%QUERY',
                prepare: function (query, settings) {
                  settings.type = "GET";
                  settings.contentType = "application/json; charset=UTF-8";
                  settings.data = JSON.stringify(query);
                   return settings;
                }
               }
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

    elt.materialtags('add', {"id" : 5, "tipo_uso" : "Analgesico"});
    /*elt.materialtags('add', {"value" : 4, "text" : "Washington", "continent" : "America"});
    elt.materialtags('add', {"value" : 7, "text" : "Sydney", "continent" : "Australia"});
    elt.materialtags('add', {"value" : 10, "text" : "Beijing", "continent" : "Asia"});
    elt.materialtags('add', {"value" : 13, "text" : "Cairo", "continent" : "Africa"});*/

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

var app = angular.module('pharmacyApp', []);
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
