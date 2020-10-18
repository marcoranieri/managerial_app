import consumer from "./consumer";


const deleteOrder = (data) => {
  const id    = parseInt(data.split(' ')[1], 10)
  const order = document.querySelector(`[data-order-id='${id}']`)

  if (order) order.remove()
}

const updateContainer = (ordersContainer, data) => ordersContainer.insertAdjacentHTML('beforeend', data)

const updateKitchenIndex = (data) => {
  const tableIdRegExp  = new RegExp('data-table-it=\".+\"')
  const priorityRegExp = new RegExp('data-order-priority=\".+\"')
  const tableId        = parseInt(data.match(tableIdRegExp)[0].split("\"")[1])
  const orderPriority  = parseInt(data.match(priorityRegExp)[0].split("\"")[1])

  document
    .querySelector(`#table-${tableId} #priority-${orderPriority}`)
    .insertAdjacentHTML('beforeend', data);
}


const initChatroomCable = () => {

  const deleteRegExp = /^delete \d+/

  const ordersContainer  = document.querySelector(".list-orders");
  const kitchenContainer = document.querySelector(".kitchen-index--js");

  if ( ordersContainer || kitchenContainer ) {

    consumer.subscriptions.create({ channel: "ChatroomChannel" }, {

      // Broadcasted data to the Channel
      received(data) {

        console.log(data);

        if (deleteRegExp.test(data)) {

          deleteOrder(data)

        } else {

          if (ordersContainer)  updateContainer(ordersContainer, data)

          if (kitchenContainer) updateKitchenIndex(data)

        }


      } // received(data)

    });  //consumer.subscriptions.create

  } // if (messagesContainer)
}

export { initChatroomCable };