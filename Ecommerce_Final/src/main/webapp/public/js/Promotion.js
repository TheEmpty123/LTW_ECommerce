document.addEventListener("DOMContentLoaded", function () {
    document.getElementById('submit-promotion-btn').addEventListener("click", function () {
        const code = document.getElementById('promotion-code').value.trim()

        fetch("/PromotionController", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({code: code})
        })
            .then((response) => response.json())
            .then((promotion) => {
                updateUI(promotion);
            })
    })

    function updateUI(promotion) {
        const totalOutput = document.getElementById('total-after-promotion');

        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
        });
        totalOutput.textContent = formatter.format(promotion.valueAfterPromotion)

        const parentNotification = document.getElementById('notification-promotion')
        parentNotification.classList.add('green')
        parentNotification.innerHTML = `
            <p style="margin-bottom: 0">${promotion.notificationOfPromotion}</p>
            `
    }
})