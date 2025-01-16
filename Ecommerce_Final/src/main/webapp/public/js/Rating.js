document.addEventListener("DOMContentLoaded", function () {
    addRating()
})

function addRating() {
    document.getElementById("sendRating").addEventListener("click", function () {
        const comment = document.getElementById("commentRate").value
        const stars = parseFloat(document.getElementById("stars").value)
        const reviewSection = this.closest(".review-section")
        const uid = parseInt(reviewSection.dataset.user)
        const uname = reviewSection.dataset.username
        const pid = parseInt(reviewSection.dataset.pid)
        console.log(uid)
        $(document).ready(function () {
            $.ajax({
                    url: "/rating",
                    type: "POST",
                    contentType: 'application/json; charset=UTF-8', // Định dạng dữ liệu gửi đi (JSON)
                    data: JSON.stringify({          // Dữ liệu gửi đến server (dạng JSON)
                        userID: uid,
                        username: uname,
                        productID: pid,
                        stars: stars,
                        commentRate: comment
                    }),
                    success: function (response) {
                        console.log("Thành công.")
                        console.log(response)
                    },
                    error: function () {
                        console.log("Không thành công")
                    }
                }
            )
        })
    })
}