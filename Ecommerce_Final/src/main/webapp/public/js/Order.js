document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("order-form");

    form.addEventListener("submit", function (e) {
        e.preventDefault(); // ❌ Ngăn form gửi mặc định

        const formData = new FormData(form); // 📦 Tạo FormData để gửi
        for (const [key, value] of formData.entries()) {
            console.log(key + ": " + value);
        }
        fetch("/order", {
            method: "POST",
            body: formData
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Có lỗi xảy ra khi gửi đơn hàng.");
                }
                return response.json(); // 👈 Server cần trả JSON
            })
            .then(data => {
                console.log(data)
                updateAd(data);
                showNotification("T")
                form.reset(); // 👉 Nếu muốn reset form
            })
            .catch(error => {
                showNotification("F")
            });
    });
});

function showNotification(status) {
    const notification = document.getElementById('result-message');
    let message = ""
    let color = ""
    if (status === "T") {
        message = "✅ Cập nhật thành công!"
        color = "green"
    } else {
        message = "❌ Cập nhật thất bại!"
        color = "red"
    }
    // Thay đổi nội dung thông báo nếu cần
    notification.textContent = message;
    notification.style.color = color;

    // Hiển thị thông báo
    notification.classList.remove('hidden');

    // Tự động ẩn thông báo sau 3 giây
    setTimeout(() => {
        notification.classList.add('hidden');
    }, 1000); // 3000ms = 3 giây
}

function updateAd(data) {
    const address = document.getElementById('address-receive')
    address.innerHTML = ''
    const newAddress = document.createElement('div')
    newAddress.classList.add('shipping-address-container')
    newAddress.innerHTML = `
        <p id="full-name" style="display: inline">${data.address.user.fullName}</p>
        <p style="display: inline">(+84)</p>
        <p style="display: inline">${data.address.user.phoneNum}</p>
        <p id="full-address">${data.address.address.fullAddress}</p>
    `;

    address.appendChild(newAddress)
}
