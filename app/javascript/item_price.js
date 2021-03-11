window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price")
const salesCommission = document.getElementById("add-tax-price")
const salesProfit = document.getElementById("profit")

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const value_result = Math.floor(inputValue * 0.1);
  salesCommission.innerHTML = value_result
  const result = Math.floor(inputValue * 0.9);
  salesProfit.innerHTML = result
})

});