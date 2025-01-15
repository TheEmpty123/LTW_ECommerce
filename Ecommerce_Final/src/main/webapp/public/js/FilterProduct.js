document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".filter").forEach(button =>{
        button.addEventListener("click", function (){
            const sort =  document.getElementById("sort-filter").textContent
            const material = document.getElementById("material-filter").textContent
            const makeMaterial = "%"+material+"%"
            console.log(sort, makeMaterial)
            fetch("/FilterProduct", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    sort: sort,
                    material: makeMaterial
                }),
            })
                .then((response) => {
                    response.json()
                })
                .then((result) =>{
                    // console.log(result.userId)
                    // updateUI(result)
                })
                .catch((error) => console.error("Lỗi:", error));

        })
    })
    function updateUI(result){
        const products = result.pageProducts
        const productArea = document.getElementById('product-area')
        productArea.innerHTML= ''
        const div = document.createElement('div')
        div.innerHTML = `
        <div id="p-product">
                <div class="container mt-5">
                    <div class="row">
                        <c:forEach var="p" items="${products}">
                            <div class="col-md-3">
                                <div class="card product-card product" data-id="${p.id}" data-name="${p.proName}"
                                     data-img="${p.thumb}" data-price="${p.price}">
                                    <a href="product?id=${p.id}&atributeID=${p.atributeID}&cateID=${p.cateID}">
                                        <img src="${p.thumb}" class="image-top"
                                             alt="${p.proName}">
                                        <img src="${p.thumb}" class="image-back"
                                             alt="${p.proName}">
                                    </a>
                                    <div class="card-body">
                                        <h6 class="product-name">${p.proName}</h6>
                                        <div class="like-price-product favourite-product" data-id="${p.id}"
                                             data-user="${result.userId}">
                                        <span class="product-price"><f:formatNumber type="currency" currencySymbol="đ"
                                                                                    value="${p.price}"/></span>
                                            <button class="wishlist-button">
                                                <i class="bi bi-heart"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="cart-see-more-btns">
                                        <div class="row">
                                            <div class="col-sm-7 col-md-7">
                                                <div class="cart-btn use-button fake-btn" style="border: none">
                                                    <button class="add-to-cart"
                                                            style="font-size: 11px; font-weight: bold;padding: 10px 5px">
                                                        THÊM VÀO GIỎ
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-sm-5 col-md-5">
                                                <div class="use-button fake-btn">
                                                    <a href="product?id=${p.id}&atributeID=${p.atributeID}&cateID=${p.cateID}">
                                                        <p>XEM THÊM</p></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- PAGINATION -->
            <div id="p-pagination">
                <div class="p-pagination-box">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center"
                            style="--bs-pagination-focus-box-shadow: 0 0 0 0.25rem rgba(21, 21, 22, 0.25);">
                            <c:if test="${result.currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="list-product?page=${result.currentPage - 1}">« Trước</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${result.totalPages}" var="page">
                                <!-- Các trang lân cận -->
                                <li class="page-item"><a class="page-link ${page == result.currentPage ? 'active' : ''}"
                                                         href="list-product?page=${page}">${page}</a></li>
                            </c:forEach>

                            <c:if test="${result.currentPage < result.totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="list-product?page=${result.currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">Tiếp »</span>
                                    </a>
                                </li>

                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        `
        productArea.appendChild(div);
    }
})