window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price")
const salesCommission = document.getElementById("add-tax-price")
const salesProfit = document.getElementById("profit")

priceInput.addEventListener("input", () => {
  console.log("イベント発火");
})

});