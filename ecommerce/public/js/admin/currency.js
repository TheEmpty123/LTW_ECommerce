document.getElementById('price').addEventListener('input', function (e) {
    // Remove non-digit characters
    let value = e.target.value.replace(/\D/g, '');
  
    // Format with periods every 3 digits
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  
    // Set the formatted value back to the input
    e.target.value = value;
  });
  