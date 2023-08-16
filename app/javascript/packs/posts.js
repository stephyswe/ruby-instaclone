import $ from 'jquery';

$(document).ready(function() {
  $('.clickable').on('click', function() {
    window.location = $(this).data('link');
  });
});