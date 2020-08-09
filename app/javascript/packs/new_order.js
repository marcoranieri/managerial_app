const newOrder = () => {

  const newOrderForm = document.getElementById("new_order")

  if (newOrderForm) {

    const radioBtnDishes = document.querySelectorAll("#new_order .form-check")

    radioBtnDishes.forEach(btn => {

      const newOrderForm = btn.parentElement.parentElement
      btn.addEventListener("click", () => newOrderForm.submit())

    });

  }

}

export { newOrder }