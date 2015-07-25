$(document).ready(function(e) {
  $('.star').click(function(e) {
    e.preventDefault();
    $('#hidden-rating').val($(this).data('value'));
    $(this).siblings().removeClass('selected');
    $(this).addClass('selected');
  });
  $('.star').on('mouseenter', function(e) {
    $(this).parent().removeClass('enabled');
  })
  $('.star').on('mouseleave', function(e) {
    $(this).parent().addClass('enabled');
  })
});