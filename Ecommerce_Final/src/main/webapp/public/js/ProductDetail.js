function showProductDetails(id, attributeId, cateId) {
    document.addEventListener("DOMContentLoaded", function () {
        console.log("ID:", id);
        console.log("AttributeID:", attributeId);
        console.log("CateID:", cateId);

        fetch('/list-product', {
            method: 'POST',
            body: JSON.stringify({
                id: id,
                attributeId: attributeId,
                cateId: cateId
            }),
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(data => {
                console.log("Response data:", data);
                if (data.status === "success") {
                    console.log("Navigating to: /product?id=" + id + "&atributeID=" + attributeId + "&cateID=" + cateId);
                    window.location.href = `/product?id=${id}&atributeID=${attributeId}&cateID=${cateId}`;
                } else {
                    console.log("Error saving product details");
                }
            })
            .catch(error => {
                console.error("Error:", error);
            });
    });

}
