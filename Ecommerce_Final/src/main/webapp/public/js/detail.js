function closePopUp(id) {
    const popup = document.getElementById(id)
    popup.style.display = 'none'
}

function getOrderDetails(order) {
    // Tìm thẻ <tr> chứa button được bấm
    const tr = order.closest("tr");

    // Lấy danh sách các thẻ <td> trong <tr> đó
    const tdList = tr.querySelectorAll("td");

    // Ví dụ: lấy nội dung cột đầu la orderID
    const idOrder = tdList[0].innerText;

    fetch(`/order-detail`, {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ids: idOrder})
    }).then(response => response.json()
    ).then(data => {
        updateUI(data.lists)
    }).catch(error => {
        console.error('Lỗi:', error);
    })

    function updateUI(list) {
        const orderDetailFrame = document.getElementById('order-details')
        orderDetailFrame.style.display = 'block'
        const detailContainer = document.getElementById('item-details');
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
        });
        detailContainer.innerHTML = ''
        list.forEach((item) => {
            const detailItem = document.createElement('div')
            detailItem.classList.add('row')
            detailItem.innerHTML = `
                     <div class="col-2">
                        <img src="${item.product.thumb}" alt="Logo" style="height: 50px; width: 50px">
                    </div>
                    <div class="col-5">
                        <p>${item.product.proName}</p>
                    </div>
                    <div class="col-3">
                        ${formatter.format(item.product.price)}
                    </div>
                    <div class="col-2">
                        ${item.amount}
                    </div>
            `
            detailContainer.appendChild(detailItem)

        })
    }
}
