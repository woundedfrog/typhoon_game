// $('#locator')
$(document).ready(
  function switchCard(card_name) {

    var last_card = $('#last-card').text();
    if (last_card === 'typhoon_bg') {
      return;
          }
      $('#shadow_window').addClass('show');
      $('#shadow_window').removeClass('hidden');

      // let clone = document.querySelector('.'+card_name+'_actual').cloneNode( true );

      let clone = document.querySelector('.card_'+last_card+'_actual').cloneNode( true );

      document.querySelector('#locator').appendChild( clone );
      // $('#last-card').removeClass('hidden');
      // $('#last-card').addClass('show');
      // $('#locator p').css('color', 'white');  // this is the popout font color
      $('#locator p').addClass('number_values_popout');


      setTimeout(function(){
        $('#locator').children().remove();
        $('#shadow_window').removeClass('show');
        $('#shadow_window').addClass('hidden');
      }, 2000);

  }
);
