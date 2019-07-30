// $('#locator')
$(document).ready(
function switchCard(card_name) {

    $('#shadow_window').addClass('show');
    $('#shadow_window').removeClass('hidden');

    var last_card = $('#last-card').text();
    // let clone = document.querySelector('.'+card_name+'_actual').cloneNode( true );
    let clone = document.querySelector('.card_'+last_card+'_actual').cloneNode( true );
    document.querySelector('#locator').appendChild( clone );
    $('#last-card').removeClass('hidden');
    $('#last-card').addClass('show');
    $('#locator p').css('color', 'white');

    setTimeout(function(){
      $('#locator').children().remove();
      $('#shadow_window').removeClass('show');
      $('#shadow_window').addClass('hidden');
    }, 2000);

  // if (elmnt == 'special') {
  //   // $('.'+card_name+"_cover").addClass('hidden');
  //   // $('.'+card_name+'_actual').removeClass('hidden');
  // } else {
  //   // $('.'+card_name+"_cover").addClass('hidden');
  //   // $('.'+card_name+'_actual').removeClass('hidden');
  //
  // }
}
);
