// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require datatable
//= require typeahead
//= require_tree .

$(document).ready(function(){

  $('#daterange').daterangepicker({
      "autoApply": true,
      "startDate": "02/25/2016",
      "endDate": "03/02/2016"
  }, function(start, end, label) {
    console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
  });

  $('#data_table').DataTable( {
      "order": [[ 3, "desc" ]]
   });

    $("#search").typeahead({
      name: "search",
      remote: "/listings/autocomplete?query=%SEARCH"
    });


})


