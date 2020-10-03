require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------


// External imports
import "bootstrap";


// Internal imports
import { createOrder } from './create_order';
import { selectList  } from './select_list';


// WHY I NEED THIIIIS AAAARGH! Why channels is not importing my action cable
import { initChatroomCable } from './../channels/chatroom_channel';


document.addEventListener('turbolinks:load', () => {


  // Init ALL Bootstrap 4 POPOVERS
  $(function () {
    $('[data-toggle="popover"]').popover({
      html : true,     // render html in popover body
      trigger: 'focus' // click to close
    })
  })


  // Create NEW ORDER in tables#show - AJAXify
  selectList();
  createOrder();

  initChatroomCable();

}); // -- turbolinks:load
