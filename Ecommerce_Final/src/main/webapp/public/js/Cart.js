
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".add-to-cart").forEach((button) => {
        button.addEventListener("click", function () {
            const productElement = this.closest(".product");
            console.log(productElement)
            const productId = productElement.dataset.id;
            const productName = productElement.dataset.name;
            const productImg = productElement.dataset.img;
            const productPrice = parseFloat(productElement.dataset.price);
            // const productQuantity = productElement.dataset.quantity;

            console.log("Day nay no day nay");
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
                    updateCartUI(cart);
                    showNotification("Đã thêm sản phẩm vào giỏ hàng.")
                })
                .catch((error) => console.error("Lỗi:", error));
        });
    });

    function updateCartUI(cart) {
        // Lấy container hiển thị giỏ hàng
        const cartContainer = document.getElementById('list-product-cart');
        const totalCart = document.getElementById('total-cart')

        // Xóa nội dung cũ của giỏ hàng
        cartContainer.innerHTML = '';

        //định dạng tiền tệ
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
        });

        totalCart.textContent = formatter.format(cart.totalPrice)

        // Duyệt qua từng sản phẩm trong giỏ hàng (cart là một mảng JSON)
        cart.items.forEach((item) => {

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
                            <a href="del-cart?pid=${item.id}" class="remove-to-cart" data-pid="${item.id}">
                                <button class="close-btn">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                            </a>
                        </div>
                    </div>
            `;
            // Thêm sản phẩm vào container
            cartContainer.appendChild(cartItem);
        });


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
        }, 3000); // 3000ms = 3 giây
    }
});
