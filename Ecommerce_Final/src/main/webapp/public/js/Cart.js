
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".add-to-cart").forEach((button) => {
        button.addEventListener("click", function () {
            const productElement = this.closest(".product");
            const productId = productElement.dataset.id;
            const productName = productElement.dataset.name;
            const productImg = productElement.dataset.img;
            const productPrice = parseInt(productElement.dataset.price);
            const productQuantity = productElement.dataset.quantity;

            // Gửi yêu cầu AJAX tới servlet
            fetch("CartController", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    id: productId,
                    name: productName,
                    img:productImg,
                    price: productPrice,
                    quantity: productQuantity
                }),
            })
                .then((response) => response.json())
                // .then((cart) => {
                //     updateCartUI(cart);
                // })
                .catch((error) => console.error("Lỗi:", error));
        });
    });

    function updateCartUI(cart) {
        const cartItemsElement = document.getElementById("cart-items");
        const totalPriceElement = document.getElementById("total-price");

        // Xóa danh sách cũ
        cartItemsElement.innerHTML = "";

        // Thêm các sản phẩm mới
        cart.items.forEach((item) => {
            const li = document.createElement("li");
            li.textContent = `${item.name} - ${item.price} đ (x${item.quantity})`;
            cartItemsElement.appendChild(li);
        });

        // Cập nhật tổng tiền
        totalPriceElement.textContent = cart.totalPrice;
    }
});
