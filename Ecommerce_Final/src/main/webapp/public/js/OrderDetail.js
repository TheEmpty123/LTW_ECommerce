function copyText() {
    const text = document.getElementById("hash-code").innerText;
    navigator.clipboard.writeText(text)
        .then(() => {
            alert("Đã sao chép vào clipboard!");
        })
        .catch(err => {
            alert("Lỗi khi sao chép: " + err);
        });
}

document.addEventListener("DOMContentLoaded", function (){
    const formVerify = document.getElementById('form-verify')

    formVerify.addEventListener("submit", function (e){
        e.preventDefault();

        const  formData = new FormData(formVerify)
        for (const [key, value] of formData.entries()) {
            console.log(key + ": " + value);
        }

        fetch("/verify",{
            method: "POST",
            body: formData
        }).then(response =>{

        }).then(data =>{

        }).catch(error =>{

        })
    });
});