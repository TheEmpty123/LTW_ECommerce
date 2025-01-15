document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".add-to-cart").forEach((button) => {
        button.addEventListener("click", function () {
            const productElement = this.closest(".product");
            const productId = productElement.dataset.id;
            const productName = productElement.dataset.name;
            const productImg = productElement.dataset.img;
            const productPrice = parseFloat(productElement.dataset.price);
            console.log(productId)
            // Gửi yêu cầu AJAX tới servlet
            fetch("/CartController", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    id: productId,
                    name: productName,
                    img: productImg,
                    price: productPrice,
                    quantity: 1
                }),
            })
                .then((response) => response.json())
                .then((cart) => {
                    console.log(cart.userName)
                    if (cart.userName != null) {
                        updateCartUI(cart);
                        showNotification("Đã thêm sản phẩm vào giỏ hàng.")
                    } else {
                        loginNotification("Bạn chưa đăng nhập!");
                    }
                })
                .catch((error) => console.error("Lỗi:", error));
        });
    });

    function removeItem() {
        document.querySelectorAll(".remove-item").forEach((button) => {
            button.addEventListener("click", function () {
                const productId = this.dataset.id;
                console.log(productId)
                fetch("/CartController?action=remove", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({id: productId})
                })
                    .then((response) => response.json())
                    .then((cart) => {
                        if (cart.userName != null) {
                            updateCartUI(cart)
                            showNotification("Đã xóa sản phẩm khỏi giỏ hàng.")
                        } else {
                            loginNotification("Phiên đã hết. Vui lòng đăng nhập lại.")
                        }
                    })
                    .catch((error) => console.error("Lỗi: ", error))
            });
        });
    }
    plusQuantityProduct()
    minusQuantityProduct()
    removeItem();

    function updateCartUI(cart) {
        // Lấy container hiển thị giỏ hàng
        const cartContainer = document.getElementById('list-product-cart');
        const totalCart = document.querySelectorAll('.total-cart')
        const countProduct = document.querySelectorAll('.total-count')

        // Xóa nội dung cũ của giỏ hàng
        cartContainer.innerHTML = '';

        //định dạng tiền tệ
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
        });
        totalCart.forEach(item => {
            item.textContent = formatter.format(cart.totalPrice)
        })

        // Duyệt qua từng sản phẩm trong giỏ hàng (cart là một mảng JSON)
        cart.lists.forEach((item) => {

            // Định dạng giá trị
            const formattedPrice = formatter.format(item.price);

            // Tạo HTML cho từng sản phẩm
            const cartItem = document.createElement('div');
            cartItem.classList.add('row');
            cartItem.innerHTML = `        
                    <div class="col-md-12 col-12 order">
                        <div class="image center-items">
                            <img src="${item.img}" alt="">
                        </div>
                        <div class="detail-order center-items" style="justify-content: left;">
                            <div>
                                <h6>${item.name}</h6>
                                <span>${item.quantity}</span> x <span> ${formattedPrice}</span>
                            </div>
                        </div>
                        <div class="close-orders center-items">
                                <button class="remove-item" data-id="${item.id}" style="border: none; background-color: white">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                        </div>
                    </div>
            `;
            // Thêm sản phẩm vào container
            cartContainer.appendChild(cartItem);
        });

        const productsOfCart = document.getElementById('products-of-cart')
        if (productsOfCart != null) {
            productsOfCart.innerHTML = '';
            cart.lists.forEach((item) => {
                // Định dạng giá trị
                const formattedPrice = formatter.format(item.price);

                // Tạo HTML cho từng sản phẩm
                const cartItem = document.createElement('div');
                cartItem.classList.add('cart-item');
                cartItem.innerHTML = `
                     <div class="image-box">
                            <img src="${item.img}" alt="Armchair Mây mới"
                                 class="item-image">
                        </div>
                        <div class="item-details">
                            <h3>${item.name}</h3>
                            <p class="item-price">${formattedPrice}</p>
                            <p class="wishlist"><span><i class="bi bi-heart"></i></span> Thêm vào Wishlist</p>
                        </div>
                       <div class="item-actions item-product" data-id="${item.id}" data-name="${item.name}" data-img="${item.img}" data-price="${item.price}" >
                            <button class="remove-item" data-id="${item.id}" style="border: none; background-color: white;">
                                <i class="bi bi-x-circle"></i>
                            </button>
                            <div class="quantity buttons-added left-btn">
                                <input type="button" value="-" class="minus-btn" id="button-minus-quantity">
                                <input type="number" name="quatity" class="quantity-input" id="input-quantity" value="${item.quantity}" min="1"
                                       inputmode="numeric" autocomplete="off">
                                <input type="button" value="+" class="plus-btn" id="button-plus-quantity">
                            </div>
                        </div>
            `;
                // Thêm sản phẩm vào container
                productsOfCart.appendChild(cartItem);
            })
        }


        removeItem();
        plusQuantityProduct()
        minusQuantityProduct()

        if (countProduct != null) {
            countProduct.forEach(item => {
                item.textContent = cart.lists.length;
            });
        }
    }

    function plusQuantityProduct() {
        document.querySelectorAll(".plus-btn").forEach((btn) => {
            btn.addEventListener("click", function () {
                const itemProduct = this.closest(".item-product");
                const productId = itemProduct.dataset.id;
                const productName = itemProduct.dataset.name;
                const productImg = itemProduct.dataset.img;
                const productPrice = parseFloat(itemProduct.dataset.price);
                // const productQuantity = productElement.dataset.quantity;

                // Gửi yêu cầu AJAX tới servlet
                fetch("/CartController", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        id: productId,
                        name: productName,
                        img: productImg,
                        price: productPrice,
                        quantity: 1
                    }),
                })
                    .then((response) => response.json())
                    .then((cart) => {
                        console.log(cart.userName)
                        if (cart.userName != null) {
                            updateCartUI(cart);
                        }
                    })
                    .catch((error) => console.error("Lỗi:", error));
            })
        })
    }
    function minusQuantityProduct() {
        document.querySelectorAll(".minus-btn").forEach((btn) => {
            btn.addEventListener("click", function () {
                const itemProduct = this.closest(".item-product");
                const productId = itemProduct.dataset.id;
                const productName = itemProduct.dataset.name;
                const productImg = itemProduct.dataset.img;
                const productPrice = parseFloat(itemProduct.dataset.price);
                // const productQuantity = productElement.dataset.quantity;

                // Gửi yêu cầu AJAX tới servlet
                fetch("/CartController?action=plus", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        id: productId,
                        name: productName,
                        img: productImg,
                        price: productPrice,
                        quantity: 1
                    }),
                })
                    .then((response) => response.json())
                    .then((cart) => {
                        console.log(cart.userName)
                        if (cart.userName != null) {
                            updateCartUI(cart);
                        }
                    })
                    .catch((error) => console.error("Lỗi:", error));
            })
        })
    }


    function showNotification(message) {
        const notification = document.getElementById('notification');

        // Thay đổi nội dung thông báo nếu cần
        notification.textContent = message;

        // Hiển thị thông báo
        notification.classList.remove('hidden');

        // Tự động ẩn thông báo sau 3 giây
        setTimeout(() => {
            notification.classList.add('hidden');
        }, 500); // 3000ms = 3 giây
    }

    function loginNotification(message) {
        const notification = document.getElementById('login-notification');

        // Thay đổi nội dung thông báo nếu cần
        notification.textContent = message;

        // Hiển thị thông báo
        notification.classList.remove('hidden');

        // Tự động ẩn thông báo sau 3 giây
        setTimeout(() => {
            notification.classList.add('hidden');
        }, 500); // 3000ms = 3 giây
    }
});


