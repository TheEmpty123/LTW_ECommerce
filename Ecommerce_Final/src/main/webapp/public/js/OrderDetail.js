function copyText() {
    const text = document.getElementById("hash-code").innerText;
    navigator.clipboard.writeText(text)
        .then(() => {
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
        }).catch(error => {

        })
    });
});