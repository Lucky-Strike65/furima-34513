window.addEventListener('load',() => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() =>{
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit");
    const tax = Math.floor(inputValue*0.1)
    addTaxPrice.innerHTML = Math.floor(tax)
    addProfit.innerHTML = Math.floor(inputValue - tax)
  });
});

