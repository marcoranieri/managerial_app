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
import { newOrder } from './new_order';
import { createOrderFetch } from './create_order_fetch';


document.addEventListener('turbolinks:load', () => {


  // Init ALL Bootstrap 4 POPOVERS
  $(function () {
    $('[data-toggle="popover"]').popover({
      html : true,     // render html in popover body
      trigger: 'focus' // click to close
    })
  })


  // Create NEW ORDER in tables#show - AJAXify
  // newOrder();
  createOrderFetch();

}); // -- turbolinks:load
