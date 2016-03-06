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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
$('.background-banner').delay( 2000 ).fadeTo('slow', 0.0);
$('.test').delay( 2000 ).fadeTo('slow', 0.0);

  legislatorSearch();
});

// function legislatorSearch() {
//   $('#search-submit').click(event, function() {
//     var searchTerm = $('#legislator-search').val().toLowerCase();
//     $.ajax({url: "legislators", type: "GET", data: {searchTerm},});
//     $('#legislator-search').val("");
//     // $('#legislator-show').append("<%= j render(partial: 'legislator') %>")
//
//     });


};
