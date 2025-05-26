function updateOrderUser(status) {
    // Gửi yêu cầu AJAX tới servlet
    fetch('/profile', {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            status: status
        }),
    })
        .then((response) =>
            response.json()
        )
        .then(orders => {
            console.log(orders)
            updateOrderManagerUI(orders)
        })
        .catch((error) => console.error("Lỗi:", error));
}

function updateOrderManagerUI(orders) {
    const tableOrders = document.getElementById('list-oder-status');
    tableOrders.innerHTML = '';
    //Xóa nội dung cũ của bảng orders

    // //định dạng tiền tệ
    const formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
    });
    console.log("Dang update giao dien.");
    orders.lists.forEach((item) => {
        console.log("Giao dien ----------")
        const formattedPrice = formatter.format(item.total);
        const orderItem = document.createElement('tr');

        // Lấy danh sách ảnh từ thumbs
        const thumbs = orders.thumbs[item.id] || [];
        const signed = orders.signsOfOrder[item.id] || [];
        console.log(signed)

        let iconVerify
        if (item.sign === true) {
            iconVerify = `<i class="bi bi-shield-fill-check" style="color: #00f004"></i>`
        } else {
            iconVerify = `<i class="bi bi-x-octagon-fill" style="color: red"></i>`
        }
        // Tạo HTML cho ảnh thumb
        let thumbHtml = '';
        let padding = 5;
        thumbs.forEach((thumb) => {
            thumbHtml += `
            <div style="position: absolute; left: ${padding}px">
                <img src="${thumb}" style="height: 50px; width: 50px">
            </div>
        `;
            padding += 20;
        });

        orderItem.innerHTML = `
        <td>${item.id}</td>
        <td>
            <div style="height: 60px; max-width: 60px; position: relative">
                ${thumbHtml}
            </div>
        </td>
        <td>${formattedPrice}</td>
        <td>${item.paymentID}</td>
        <td>${item.shippingStatus}</td>
        <td id="verify-icon-${item.id}">${iconVerify}</td>
        <td><i class="bi bi-three-dots-vertical detail"  onclick="getOrderDetails(this)"></i></td>
        <td><i class="bi bi-pencil-square sign"
            onclick="signOrderPopUp(this)"></i>
        </td>
    `;

        // Thêm vào bảng
        document.querySelector('#table-order tbody').appendChild(orderItem);
    });

}