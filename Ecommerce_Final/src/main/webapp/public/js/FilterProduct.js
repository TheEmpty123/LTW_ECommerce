document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".filter").forEach(button => {
        button.addEventListener("click", function () {
            const sort = document.getElementById("sort-filter").textContent
            const material = document.getElementById("material-filter").textContent
            console.log(sort, material)
            fetch("/FilterProduct", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=UTF-8",
                },
                body: JSON.stringify({
                    sort: sort,
                    material: material
                }),
            })
                .then((response) => {
                    // response.json()
                    return response.json()
                })
                .then(data => {
                    updateUI(data)
                    console.log(data)
                })
                .catch((error) => console.error("Lỗi:", error));
        })
    })


    function updateUI(result) {
        //định dạng tiền tệ
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
        });
        const productArea = document.getElementById('product-area')
        productArea.innerHTML = ''
        result.pageProducts.forEach((item)=>{
            const column = document.createElement('div')
            const formattedPrice = formatter.format(item.price);
            column.classList.add("col-md-3")
            column.innerHTML = `
                <div class="card product-card product" data-id="${item.id}" data-name="${item.proName}"
                     data-img="${item.thumb}" data-price="${item.price}">
                    <a href="product?id=${item.id}&atributeID=${item.atributeID}&cateID=${item.cateID}">
                        <img src="${item.thumb}" class="image-top"
                             alt="${item.proName}">
                        <img src="${item.thumb}" class="image-back"
                             alt="${item.proName}">
                    </a>
                    <div class="card-body">
                        <h6 class="product-name">${item.proName}</h6>
                        <div class="like-price-product favourite-product" data-id="${item.id}"
                             data-user="${result.userId}">
                        <span class="product-price">${formattedPrice}</span>
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
                                    <a href="product?id=${item.id}&atributeID=${item.atributeID}&cateID=${item.cateID}">
                                        <p>XEM THÊM</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        `
            productArea.appendChild(column);
        })
        const pagination = document.getElementById("p-pagination")
        pagination.innerHTML = ''

        const currentPage= result.currentPage;
        const totalPages = result.totalPages;
        let nextPage = 0;
        let previousPage = 0;
        if (currentPage > 1){
            previousPage = currentPage-1;
        }
        if(currentPage <totalPages){
            nextPage = currentPage +1;
        }
        const newPaginationBox = document.createElement('div')
        newPaginationBox.classList.add("p-pagination-box")

        let paginationHTML = `
             <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center"
                        style="--bs-pagination-focus-box-shadow: 0 0 0 0.25rem rgba(21, 21, 22, 0.25);">
                            <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
                                    <button class="page-link" id="previous-btn">« Trước</button>
                            </li>
            `
        // let paginationHTML = `
        //      <nav aria-label="Page navigation">
        //             <ul class="pagination justify-content-center"
        //                 style="--bs-pagination-focus-box-shadow: 0 0 0 0.25rem rgba(21, 21, 22, 0.25);">
        //                     <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
        //                         <a class="page-link" href=list-product?page=${previousPage}">
        //                             <button id="next-btn">« Trước</button>
        //                         </a>
        //                     </li>
        //     `
        for (let page = 1; page <= totalPages; page++) {
            paginationHTML += `
                    <li class="page-item ${page == currentPage ? 'active' : ''}">
                         <button class="page-link" id="current-btn">${page}</button>
                    </li>
            `
            // paginationHTML += `
            //         <li class="page-item">
            //              <a class="page-link ${page == currentPage ? 'active' : ''}" href="list-product?page=${page}">
            //                                  <button id="current-btn">${page}</button>
            //                                  </a>
            //         </li>
            // `
        }
        paginationHTML +=`
                <li class="page-item ${currentPage === totalPages? 'disabled' : ''}"">
                            <span aria-hidden="true"> <button class="page-link" id="next-btn">Tiếp »</button></span>
                </li>
            </ul>
        </nav>
        `
        // paginationHTML +=`
        //         <li class="page-item">
        //                 <a class="page-link" href="list-product?page=${nextPage}" aria-label="Next">
        //                     <span aria-hidden="true"> <button id="previous-btn">Tiếp »</button></span>
        //                 </a>
        //         </li>
        //     </ul>
        // </nav>
        // `
        newPaginationBox.innerHTML = paginationHTML
        pagination.appendChild(newPaginationBox)


        document.getElementById("next-btn").addEventListener("click", function () {
            const sort = document.getElementById("sort-filter").textContent
            const material = document.getElementById("material-filter").textContent
            console.log("TTTTTT")
            fetch(  `/FilterProduct?page=${currentPage+1}`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=UTF-8",
                },
                body: JSON.stringify({
                    sort: sort,
                    material: material
                }),
            })
                .then((response) => {
                    // response.json()
                    return response.json()
                })
                .then(data => {
                    updateUI(data)
                    console.log(data)
                })
                .catch((error) => console.error("Lỗi:", error));

        })

        document.getElementById("previous-btn").addEventListener("click", function () {
            const sort = document.getElementById("sort-filter").textContent
            const material = document.getElementById("material-filter").textContent
            fetch(`/FilterProduct?page=${currentPage-1}`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=UTF-8",
                },
                body: JSON.stringify({
                    sort: sort,
                    material: material
                }),
            })
                .then((response) => {
                    // response.json()
                    return response.json()
                })
                .then(data => {
                    updateUI(data)
                    console.log(data)
                })
                .catch((error) => console.error("Lỗi:", error));

        })

    }

})

