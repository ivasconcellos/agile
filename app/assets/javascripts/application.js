// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2

//= require jquery-ui
//= require jquery_ujs
//= require jquery-ui/widget
//= require jquery-ui/sortable
//= require cable
//= require activestorage
//= require turbolinks
//= require ckeditor/init

//= require bootstrap-datepicker

//= require_tree .

$( document ).on('turbolinks:load', function() {
  (function( $ ) {
    $(function() {
      $('#cpf').mask('999.999.999-99', {reverse: true});
    });
  })(jQuery);
})

function initialize() {
  $
  $(".data").mask("99/99/9999");
  $(".data").datepicker({
    dateFormat: 'dd/mm/yy',
    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
    nextText: '>>',
    prevText: '<<'
  });
}

