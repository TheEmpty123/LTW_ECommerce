function cancelUpdate() {
    const updateFrame = document.getElementById('update-public-key')
    document.getElementById('public-key-input').value = ""
    updateFrame.style.display = 'None'
}

function showUpdateFrame(userID) {
    if (userID === undefined) {
        showNotification("Failed", "Vui lòng đăng nhập!")
    } else {
        const updateFrame = document.getElementById('update-public-key')
        updateFrame.style.display = "block"
    }
}

function updatePublicKey(userID) {
    const inputKey = document.getElementById('public-key-input').value
    if (inputKey.trim() === "") {
        validateInputUpdate()
    } else {
        fetch(`/update-key`, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({inputKey: inputKey})
        }).then(response => response.text()
        ).then(data => {
            update(data)
        }).catch(error => {
            console.error('Lỗi:', error);
        })
    }
}

function validateInputUpdate() {
    const tooltip = document.getElementById("tooltipText");

    // Nếu input trống, hiện tooltip
    tooltip.classList.add("show-tooltip");

    // Tự động ẩn tooltip sau 3 giây (nếu muốn)
    setTimeout(() => {
        tooltip.classList.remove("show-tooltip");
    }, 3000);
}

function update(data) {
    if (data === "Failed") {
        showNotification("Failed", "Cập nhật thất bại!")
    } else {
        cancelUpdate()
        showNotification("Success", "Đã cập nhật khóa công khai thành công.")
    }
}

function showNotification(status, message) {
    const notification = document.getElementById('notification');
    if (status === "Failed") {
        notification.style.backgroundColor = "red"
    } else {
        notification.style.backgroundColor = "#4caf50"
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
