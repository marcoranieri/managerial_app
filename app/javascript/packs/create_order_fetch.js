const createOrderFetch = () => {

  const radioBtnDishes = document.querySelectorAll(".dish-name")

  if (radioBtnDishes) {

    radioBtnDishes.forEach(btn => {

      console.log(btn)
      btn.addEventListener("click", (event) => {

        console.log(event)

        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        const data = { dish_id: event.currentTarget.dataset.dishId}

        fetch(window.location.pathname + "/create_order", {
          method: 'POST',
          headers:  {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "X-CSRF-Token": csrfToken
          },
          body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then((mydata) => {
          console.log(mydata);
          console.log(mydata[0].table_id);
          const tableId = mydata[0].table_id
          const showTableOrder = document.querySelector(`ul#show-table-${tableId}`)
          showTableOrder.innerHTML = ""
          mydata.forEach(data => {
            console.log(data)
            const listItem = `
              <li data-dish-id="${data.dish_id}" data-dish-name="${data.dish.name}">
                <div class="d-flex justify-content-between">
                  <p>${data.dish.name}</p>
                  <p><a data-remote="true" rel="nofollow" data-method="delete" href="/tables/${data.table_id}/orders/${data.id}"><i class="far fa-trash-alt"></i></a></p>
                </div>
              </li>
            `
            showTableOrder.innerHTML += listItem
          })
        });

      }); // addEventListener

    }); // forEach

  } // if (radioBtnDishes)


}

export {createOrderFetch}