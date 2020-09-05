const createOrderFetch = () => {

  const btnDishes = document.querySelectorAll(".dish--js")

  if (btnDishes) {

    btnDishes.forEach(btn => {

      btn.addEventListener("click", (event) => {

        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

        const data = { dish_id: event.currentTarget.dataset.dishId, color: event.currentTarget.dataset.dishColor}

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

          const showTableOrder = document.querySelector(`#show-table-${mydata[0].table_id}`)

          showTableOrder.innerHTML = ""

          mydata.forEach(data => {
            const listItem = `
              <div data-dish-id="${data.dish.id}"
                data-dish-name="${data.dish.name}"
                data-dish-color="${data.dish.color}"
                style="
                  background-color:${data.dish.color};
                  padding: 20px 0;
                  margin: 5px auto;
                  box-shadow: 0 2px 3px darkgray;
                ">

                <div class="d-flex justify-content-between">
                  <p>${data.dish.name}</p>
                  <a class="delete-order-btn" data-remote="true" rel="nofollow" data-method="delete" href="/tables/${data.table_id}/orders/${data.id}"><i class="far fa-trash-alt"></i></a>
                </div>
              </div>
            `

            showTableOrder.innerHTML += listItem
          })
        });

      }); // btn.addEventListener("click"

    }); // mydata.forEach(data

  } // if (radioBtnDishes)


}

export {createOrderFetch}