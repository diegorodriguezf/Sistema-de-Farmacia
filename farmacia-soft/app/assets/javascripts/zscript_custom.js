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
        datumTokenizer : Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer : Bloodhound.tokenizers.whitespace,
        prefetch       : '../assets/cities.json'
    });
  /*  tipoUso.initialize();
    elt = $('#tipoUso');
    elt.materialtags({
        itemValue   : 'value',
        itemText    : 'text',
        typeaheadjs : {
            name       : 'tipoUso',
            displayKey : 'text',
            source: function(query, process) {
                return $.ajax({
                    url: $(this)[0].$element[0].dataset.link,
                    type: 'get',
                    data: {query: query},
                    dataType: 'json',
                    success: function(json) {
                        return typeof json.options == 'undefined' ? false : process(json.options);
                    }
                });
          }
        }*/
    });

  /*  elt.materialtags('add', {"value" : 1, "text" : "Amsterdam", "continent" : "Europe"});
    elt.materialtags('add', {"value" : 4, "text" : "Washington", "continent" : "America"});
    elt.materialtags('add', {"value" : 7, "text" : "Sydney", "continent" : "Australia"});
    elt.materialtags('add', {"value" : 10, "text" : "Beijing", "continent" : "Asia"});
    elt.materialtags('add', {"value" : 13, "text" : "Cairo", "continent" : "Africa"});

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
    }).trigger('change');*/
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
