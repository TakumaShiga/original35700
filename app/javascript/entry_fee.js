window.addEventListener('load', () => {
 const feeInput = document.getElementById("entry-price");

  feeInput.addEventListener('input', ()=> {
    const inputValue = feeInput.value;
    const addTaxDom = document.getElementById('add-tax-fee');
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const feeProfit = document.getElementById("profit")
    feeProfit.innerHTML = inputValue - (inputValue * 0.1);
  });
});