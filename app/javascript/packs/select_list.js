const handleSelection = (e) => {
  [... e.currentTarget.parentNode.children].forEach(list => list.classList.remove("active-list"))
  e.currentTarget.classList.add("active-list")
}

const selectList = () => {

  const lists = document.querySelectorAll(".orders-list")

  if (lists) lists.forEach(list => list.addEventListener("click", handleSelection))

}

export { selectList }
