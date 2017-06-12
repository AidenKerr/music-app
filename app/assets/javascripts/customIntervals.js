$(function() {
  $('#intervals input[type=radio]').on('change', function() {
    if ($(this).val() === "custom") {
      $('#custom-value').show();
    } else {
      $('#custom-value').hide();
    }
  });
  
  $('#chord-form').on('submit', function() {
    if ($('#intervals input[type=radio]:checked').val() === "custom") {
      var customValue = $('#custom-value').val();
      $('#custom-option').val(customValue);
    }
  })
});