document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".filter").forEach(button =>{
        button.addEventListener("click", function (){
            const sort = document.getElementById("sort-filter").textContent
            const material = document.getElementById("material-filter").textContent
            const makeMaterial = "%"+material+"%"
            fetch("/FilterProduct", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    sort: sort,
                    material: makeMaterial
                }),
            }).then((response) => response.json())
                .then((result) =>{
                    updateUI(result)
                })
                .catch((error) => console.error("Lỗi:", error));

        })
    })
    function updateUI(products){
    }
})