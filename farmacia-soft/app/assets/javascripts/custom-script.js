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
    var multiple = $('#tipoUso').materialize_autocomplete({
           multiple: {
               enable: true
           },
           appender: {
               el: '.ac-users'
           },
           dropdown: {
               el: '#multipleDropdown'
           }
       });
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
