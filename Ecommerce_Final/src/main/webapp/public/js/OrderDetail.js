function copyText() {
    const text = document.getElementById("hash-code").innerText;
    navigator.clipboard.writeText(text)
        .then(() => { alert("Đã sao chép thành công!");
        })
        .catch(err => {
            alert("Lỗi khi sao chép: " + err);
        });
}

function cancelVerify() {
    const formFrame = document.getElementById('verify-frame')
    const form = document.getElementById('form-verify')
    formFrame.style.display = 'None'
    form.reset()
    // Reset reCAPTCHA khi mở lại
    if (typeof grecaptcha !== "undefined") {
        grecaptcha.reset();
    }
}

document.addEventListener("DOMContentLoaded", function () {
    const formVerify = document.getElementById('form-verify')
    const verifyFrame = document.getElementById('verify-frame')

    formVerify.addEventListener("submit", function (e) {

        e.preventDefault();
        const formData = new FormData(formVerify)
        for (const [key, value] of formData.entries()) {
            console.log(key + ": " + value);
        }

        fetch(`/verify`, {
            method: "POST",
            body: formData
        }).then(response => response.json()
        ).then(data => {
            verifyFrame.style.display = "None"
            //Reset reCaptchaZ
            if (typeof grecaptcha !== "undefined") {
                grecaptcha.reset();
            }
            showNotificationOrderSuccess("Success", "Bạn đã đặt hàng thành công.")
            updateProductCart();
        }).catch(error => {

        })
    });
});

function choosePayment(method){
    fetch(`/payment`, {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({method: method})
    }).then(response => response.json()
    ).then(data => {

    }).catch(error => {
        console.error('Lỗi:', error);
    })
}

function updateProductCart(){
    const listProduct = document.getElementById('list-product');
    listProduct.innerHTML = ''
    const totalBeforePromotion = document.getElementById('total-before-promotion')
    totalBeforePromotion.innerText = "0"
    const valueOfPromotion = document.getElementById('value-of-promotion')
    valueOfPromotion.innerText = "0"
    const totalAfterPromotion  = document.getElementById('total-after-promotion')
    totalAfterPromotion.innerText = "0"

}
function showNotificationOrderSuccess(status, message) {
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
