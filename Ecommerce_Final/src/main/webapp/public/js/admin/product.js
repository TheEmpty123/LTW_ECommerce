$(document).ready(function () {
    $.ajax({
        url: "/api/products",
        type: "GET",
        success: function (data) {
            let tbody = $("#product-table tbody");
            tbody.empty();
            data.forEach((product) => {
                let row = `
                    <tr>
                        <td>#${product.id}</td>
                        <td class="td-product">
                            <img src="/${product.thumb}" alt="">
                            ${product.name}
                        </td>
                        <td>${product.price.toLocaleString('vi-VN')}₫</td>
                        <td>${product.stock} Item Left
<!--                            <h4>${product.sold} Sold</h4>-->
                        </td>
                        <td>${product.category}</td>
                        <td>
                            <span class="badge rating">
                                <span class="ti-star"></span>
                                ${product.averageRating}
                            </span>
                            <h5>${product.totalReviews} reviews</h5>
                        </td>
                        <td>
                                                                <a href="#" class="openIframePopup">
                                            <span class="ti-plus"></span>
                                        </a>
                                        <a href="edit-product.jsp">
                                            <span class="ti-pencil-alt"></span>
                                        </a>
                                        <a href="#">
                                            <span class="ti-trash"></span>
                                        </a>
</td>
                    </tr>
                `;
                tbody.append(row);
            });
        },
        error: function () {
            console.error("Failed to fetch product data");
        },
    });
});
