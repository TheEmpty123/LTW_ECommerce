document.addEventListener("DOMContentLoaded", function (){
    document.querySelectorAll(".wishlist-button").forEach((button) =>{
        button.addEventListener("click", function (){
            const  productElement  = this.closest(".product");

            const  productId = productElement.dataset.id;
            const userId = parseInt(productElement.dataset.user);


            fetch("/favouriteProducts", {
                method: "POST",
                headers:{
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    productId : productId,
                    userId : userId
                }),
            })
                .then((response) => response.json())
                .then()
                .catch((error) => console.error("Lỗi:", error));
        })
    })
})
