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
//= require_tree .
//= require cocoon
//= require jquery.flot
//= require jquery.flot.resize

var ready;
ready = function() {
  if($(".add_fields").length == 1&& $("#edit").length == 0){
    $(".add_fields").click();
    $(".nested-fields .add_fields").click();
    $(".nested-fields .add_fields").remove();
  }
  $('#observations').on('cocoon:after-insert', function(e, insertedItem) {
    if($(insertedItem['0']).hasClass("nested-fields")){
      $(".nested-fields .add_fields").click();
      $(".nested-fields .add_fields").remove();
      el = $(insertedItem)['0'];
      $(el).find( ".collection_select" ).selectToAutocomplete();
    }
  });
  if($('.collection_select').length == 1){
    $('.collection_select').selectToAutocomplete();
  }
};

function CreateNewObs(el){

  last = $( "input[type=text]:last-of-type" ).length;
  console.log($( "input[type=text]:last-of-type"));
  if($(el)['0'].id == $( "input[type=text]:last-of-type" )[last-1].id){
    $(".add_obs").click();
  }
}
$(document).ready(ready);
$(document).on('page:load', ready);
