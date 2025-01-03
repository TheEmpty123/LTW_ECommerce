document.querySelectorAll('.remove-from-cart').forEach(link => {
    link.addEventListener('click', function (event) {
        event.preventDefault(); // Ngăn điều hướng mặc định
        const pid = this.dataset.pid;

        // Gửi yêu cầu xóa sản phẩm qua AJAX
        fetch(`/del-cart?pid=${pid}`)
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Product removed successfully');
                    // Cập nhật giao diện (ví dụ: ẩn sản phẩm đã bị xóa)
                    this.closest('.list-product-cart').remove();
                } else {
                    alert(data.error || 'Failed to remove product');
                }
            })
            .catch(error => console.error('Error:', error));
    });
});
