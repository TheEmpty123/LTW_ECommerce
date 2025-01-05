
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

            // console.log("Day nay no day nay");
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
                    if(cart.userName != null){
                        updateCartUI(cart);
                        showNotification("Đã thêm sản phẩm vào giỏ hàng.")
                    }else{
                        loginNotification("Bạn chưa đăng nhập!");
                    }

                })
                .catch((error) => console.error("Lỗi:", error));
        });
    });

    function removeItem(){
        document.querySelectorAll(".remove-item").forEach((button) =>{
            console.log(button)
            button.addEventListener("click",function (){
                const productId = this.dataset.id;
                console.log(productId)
                fetch("/CartController?action=remove",{
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({id :productId})
                })
                    .then((response) =>response.json())
                    .then((cart) => {
                        if (cart.userName != null){
                            updateCartUI(cart)
                            showNotification("Đã xóa sản phẩm khỏi giỏ hàng.")
                        }else{
                            loginNotification("Phiên đã hết. Vui lòng đăng nhập lại.")
                        }
                    })
                    .catch((error) => console.error("Lỗi: ", error))
            });
        });
    }

    removeItem();

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
                                <button class="remove-item" data-id="${item.id}" style="border: none; background-color: white">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                        </div>
                    </div>
            `;
            // Thêm sản phẩm vào container
            cartContainer.appendChild(cartItem);
        });

       removeItem();

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

    function loginNotification(message) {
        const notification = document.getElementById('login-notification');

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
