function cancelSign() {
    const signatureFrame = document.getElementById('signature-frame')
    document.getElementById('signature-input').value= ""
    signatureFrame.style.display = 'None'
}

function signOrderPopUp(order) {
    // Tìm thẻ <tr> chứa button được bấm
    const tr = order.closest("tr");

    // Lấy danh sách các thẻ <td> trong <tr> đó
    const tdList = tr.querySelectorAll("td");

    // Ví dụ: lấy nội dung cột đầu la orderID
    const idOrder = tdList[0].innerText;

    fetch(`/hash`, {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ids: idOrder})
    }).then(response => response.text()
    ).then(data => {
        updateSignUI(data)
    }).catch(error => {
        console.error('Lỗi:', error);
    })
}

function updateSignUI(data) {
    const signatureFrame = document.getElementById('signature-frame')
    const hashTf = document.getElementById('hash-code')
    hashTf.innerText = data
    signatureFrame.style.display = 'block'
}

function sign() {
    const signature = document.getElementById('signature-input').value
    const hashCode = document.getElementById('hash-code').textContent

    if (signature.trim() === "") {
        validateInput()
    } else {
        fetch(`/signature`, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                signature: signature,
                hashcode: hashCode
            })
        }).then(response => response.text()
        ).then(data => {
            console.log("Response : " +data)
            updateUI(data)
        }).catch(error => {

        })
    }
}

function updateUI(data) {
    if (data === "Fail") {
        showNotification("Fail", "Chứ ký không hợp lệ!")
    } else {
        const icon = document.querySelector(`#verify-icon-${data}`);
        cancelSign()
        showNotification("Success", "Đã ký xác thực đơn hàng thành công.")
        icon.innerHTML = `<i class="bi bi-shield-fill-check" style="color: #00f004"></i>`
    }
}

function showNotification(status, message) {
    const notification = document.getElementById('notification');
    if (status === "Fail") {
        notification.style.backgroundColor = "red"
    }else{
        notification.style.backgroundColor= "#4caf50"
    }

    // Thay đổi nội dung thông báo nếu cần
    notification.textContent = message;

    // Hiển thị thông báo
    notification.classList.remove('hidden');

    // Tự động ẩn thông báo sau 3 giây
    setTimeout(() => {
        notification.classList.add('hidden');
    }, 1000); // 3000ms = 3 giây
}

function validateInput() {
    const tooltip = document.getElementById("tooltipText");

    // Nếu input trống, hiện tooltip
    tooltip.classList.add("show-tooltip");

    // Tự động ẩn tooltip sau 3 giây (nếu muốn)
    setTimeout(() => {
        tooltip.classList.remove("show-tooltip");
    }, 3000);
}

