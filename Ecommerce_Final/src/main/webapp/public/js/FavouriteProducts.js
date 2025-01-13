document.addEventListener("DOMContentLoaded", function (){
    document.querySelectorAll(".wishlist-button").forEach((button) =>{
        button.addEventListener("click", function (){
            const  productElement  = this.closest(".favourite-product");

            const  productId = parseInt(productElement.dataset.id);
            const userId = parseInt(productElement.dataset.user);
            console.log(productId, userId)

            fetch("/favouriteProducts", {
                method: "POST",
                headers:{
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    productID: productId,
                    userID : userId
                }),
            })
                .then((response) => response.json())
                .then((result) =>{
                    console.log(result.listProduct)
                })
                .catch((error) => console.error("Lỗi:", error));
        })
    })
})
