//
// document.addEventListener("DOMContentLoaded", function () {
//     document.querySelectorAll(".wishlist-button").forEach((button) => {
//         button.addEventListener("click", function () {
//             // button.classList.toggle("clicked")
//
//             const productElement = this.closest(".favourite-product");
//
//             const productId = parseInt(productElement.dataset.id);
//             const userId = parseInt(productElement.dataset.user);
//             console.log(userId)
//             fetch("/favouriteProducts", {
//                 method: "POST",
//                 headers: {
//                     "Content-Type": "application/json",
//                 },
//                 body: JSON.stringify({
//                     productID: productId,
//                     userID: userId
//                 }),
//             })
//                 .then((response) => response.json())
//                 .then(
//                     (list) => {
//                         button.classList.toggle("clicked")
//                 }
//                 )
//                 .catch((error) => console.error("Lỗi:", error));
//         })
//     })
// })
//
// function fetchFavorites() {
//     fetch("/favouriteProducts")
//         .then(response => response.json())
//         .then(favorites => {
//             updateFavoriteDisplay(favorites)
//         })
//         .catch(error => {
//             console.error('Error fetching favorites:', error)
//         })
// }
//
// function updateFavoriteDisplay(favoritesList) {
//     document.querySelectorAll(".favourite-product").forEach((favorites) => {
//         const productId = parseInt(favorites.dataset.id)
//         const heartIcon = favorites.querySelector(".wishlist-button")
//         if (favoritesList.includes(productId)) {
//             heartIcon.classList.add("clicked")
//         } else {
//             heartIcon.classList.remove("clicked")
//
//         }
//     })
// }
// document.addEventListener('DOMContentLoaded', () => {
//     fetchFavorites();
// });
//
//
//
