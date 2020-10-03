const createOrder = () => {

  const btnDishes = document.querySelectorAll(".dish--js")


  if (btnDishes && document.querySelector(".active-list")) {

    btnDishes.forEach(dish => {

      dish.addEventListener("click", (event) => {

        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

        const data = {
          dish_id: event.currentTarget.dataset.dishId,
          color: event.currentTarget.dataset.dishColor,
          priority: document.querySelector(".active-list").dataset.priority
        }

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

          // const activeList = document.querySelector(`#show-table-${mydata[0].table_id}`)
          const activeList = document.querySelector(".active-list")

          // activeList.innerHTML = ""
          const last = mydata[mydata.length - 1]
          // mydata.forEach(data => {
            const listItem = `
              <div data-dish-id="${last.dish.id}"
                data-dish-name="${last.dish.name}"
                data-dish-color="${last.dish.color}"
                style="
                  background-color:${last.dish.color};
                  margin: 5px auto;
                  box-shadow: 0 2px 3px darkgray;
                ">

                <div class="d-flex justify-content-between order-item">
                  <p>${last.dish.name}</p>
                  <a class="delete-order-btn" data-remote="true" rel="nofollow" data-method="delete" href="/tables/${last.table_id}/orders/${last.id}"><i class="far fa-trash-alt"></i></a>
                </div>
              </div>
            `

            activeList.innerHTML += listItem
          // })
        });

      }); // btn.addEventListener("click"

    }); // btnDishes.forEach(dish =>

  } // if (btnDishes && document.querySelector(".active-list"))


}

export { createOrder }