document.addEventListener("DOMContentLoaded", function () {
    addRating()
})

function addRating() {
    document.getElementById("sendRating").addEventListener("click", function () {
        const comment = document.getElementById("commentRate").value
        const reviewSection = this.closest(".review-section")
        const uid = parseInt(reviewSection.dataset.user)
        const uname = reviewSection.dataset.username
        const pid = parseInt(reviewSection.dataset.pid)
        console.log(uid)
        $(document).ready(function () {
            const selectedRating = $('#rating').val();
            // Kiểm tra nếu chưa chọn
            if (!selectedRating) {
                alert("Vui lòng chọn số sao để đánh giá!");
                return;
            }
            $.ajax({
                    url: "/rating",
                    type: "POST",
                    contentType: 'application/json; charset=UTF-8', // Định dạng dữ liệu gửi đi (JSON)
                    data: JSON.stringify({          // Dữ liệu gửi đến server (dạng JSON)
                        userID: uid,
                        username: uname,
                        productID: pid,
                        stars: selectedRating,
                        commentRate: comment
                    }),
                    success: function (response) {
                        console.log(response)
                        updateUI(response)
                    },
                    error: function () {
                        console.log("Không thành công")
                    }
                }
            )
        })
    })
}
function updateUI(response){
    const ratingSession = document.getElementById("rating-session")
    ratingSession.innerHTML = ''

    let ratingHTML = `
           <h2>ĐÁNH GIÁ SẢN PHẨM</h2>
            <div class="rating-overview">
                <div class="rating-score">
                    <span>${response.avgStars}</span>
                    <p>trên 5</p>
                    <p>⭐⭐⭐⭐⭐</p>
                </div>
                <div class="rating-filters">
                    <button>Tất Cả</button>
                    <button>5 Sao (${response.fivestars})</button>
                    <button>4 Sao (${response.fourstars})</button>
                    <button>3 Sao (${response.threestars})</button>
                    <button>2 Sao (${response.twostars})</button>
                    <button>1 Sao (${response.onestars})</button>
                </div>
            </div>
            
            <strong class="${response.totalRate == 0 ? 'hidden-text' : ''}">Sản phẩm chưa có đánh giá nào</strong>
    `
    response.ratings.forEach(item =>{
        ratingHTML += `
            <div class="review">
                    <div class="review-header">
                        <strong>${item.username}</strong>
                        <span>${item.stars} ⭐</span>
                        <p>2024-07-28 00:19</p>
                    </div>
                    <p>${item.commentRate}</p>
                </div>
        `
    })
    ratingHTML += `
        <div class="product-review">
                <h3 style="margin-top: 4px;">Đánh giá sản phẩm</h3>
                <select id="rating"
                        style="padding: 13px 0; margin-right: 10px; border-color: #c6c6c6; border-radius: 3px">
                    <option value="1">1 ⭐</option>
                    <option value="2">2 ⭐</option>
                    <option value="3">3 ⭐</option>
                    <option value="4">4 ⭐</option>
                    <option value="5">5 ⭐</option>
                </select>

                <textarea id="commentRate" placeholder="Nhập đánh giá của bạn ở đây..." rows="1"></textarea>
                <button id="sendRating" type="submit">Gửi đánh giá</button>
            </div>
    `
    const newRatingArea = document.createElement("div")
    newRatingArea.classList.add("rating-area")
    newRatingArea.innerHTML = ratingHTML
    ratingSession.appendChild(newRatingArea)

}