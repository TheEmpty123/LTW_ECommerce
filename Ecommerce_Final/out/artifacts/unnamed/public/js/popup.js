  // Xử lí phần ẩn hiện giỏ hàng
  const pop_up_cart = document.getElementById('mask-container')
  function showCart(){
      document.body.style.overflow = 'hidden';
      pop_up_cart.style.opacity = 1;
      pop_up_cart.style.zIndex = 2000;
      pop_up_cart.style.transform = 'translateX(0)'
      pop_up_cart.style.transition = 'transform 0.5s ease'
  }
  function hiddenCart(){
      document.body.style.overflow = 'auto';
      pop_up_cart.style.transform = 'translateX(50%)'
      pop_up_cart.style.transition = 'transform 0.5s ease'
      pop_up_cart.style.opacity = 0;
      pop_up_cart.style.zIndex = -2000;
  }
  document.getElementById('mask-cart').addEventListener('click', hiddenCart)
  document.getElementById('close-pop-up').addEventListener('click', hiddenCart)