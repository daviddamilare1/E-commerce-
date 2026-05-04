console.log('Working...');

$(document).ready(function() {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top',
        showConfirmButton: false,
        timer: 2000,
        timerProgressBar: true
    });

    // Add to Cart
    function generateCartId() {
        const ls_cartid = localStorage.getItem('cartId');
        
        if (ls_cartid === null) {
            let cartId = "";
            for (let i = 0; i < 10; i++) {
                cartId += Math.floor(Math.random() * 10);
            }
            localStorage.setItem('cartId', cartId);
            return cartId;
        }
        return ls_cartid;
    }

    // Function to update button state based on localStorage
    function updateButtonStates() {
        const cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
        $('.add_to_cart').each(function() {
            const button_el = $(this);
            const id = button_el.attr('data-id');
            if (cartItems.includes(id)) {
                button_el.html('Added to cart <i class="fas fa-shopping-cart ms-2"></i>');
            }
        });
    }

    // Call on page load
    updateButtonStates();

    // Add to cart function
    $(document).on('click', '.add_to_cart', function(e) {
        e.preventDefault();
        const button_el = $(this);
        const id = button_el.attr('data-id');
        const qty = $('.quantity').val();
        const size = $('input[name="size"]:checked').val();
        const color = $('input[name="color"]:checked').val();
        const cart_id = generateCartId();
        console.log('Size:', size);
        console.log('Color:', color);

        $.ajax({
            url: '/add_to_cart/',
            data: {
                id: id,
                qty: qty,
                size: size,
                color: color,
                cart_id: cart_id,
            },
            beforeSend: function() {
                button_el.html('Adding to cart <i class="fas fa-spinner fa-spin ms-2"></i>');
            },
            success: function(response) {
                console.log(response);
                Toast.fire({
                    icon: 'success',
                    title: response.message,
                });
                button_el.html('Added to cart <i class="fas fa-shopping-cart ms-2"></i>');

                // Update localStorage with the added item
                let cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
                if (!cartItems.includes(id)) {
                    cartItems.push(id);
                    localStorage.setItem('cartItems', JSON.stringify(cartItems));
                }

                // Update total items in cart
                $('.total_cart_items').text(response.total_cart_items);
            },
            error: function(xhr, status, error) {
                console.log('Error Status:', xhr.status);
                console.log('Response Text:', xhr.responseText);

                let errorResponse = JSON.parse(xhr.responseText);
                Toast.fire({
                    icon: 'error',
                    title: errorResponse.error,
                });
            }
        });
    });




    $(document).on('click', '.delete_cart_item', function() {
        const button_el = $(this);
        const item_id = button_el.attr('data-item_id');
        const product_id = button_el.attr('data-product_id');
        const cart_id = generateCartId();
        const original_button_html = button_el.html(); // Store original button HTML

        $.ajax({
            url: '/delete_cart_item/',
            method: 'GET', // Explicitly specify GET
            data: {
                id: product_id,
                item_id: item_id,
                cart_id: cart_id,
            },
            beforeSend: function() {
                button_el.html('<i class="fas fa-spinner fa-spin ms-2"></i>').prop('disabled', true);
            },
            success: function(response) {
                // Log response for debugging
                console.log(response);

                // Show success toast
                if (typeof Swal !== 'undefined') { // Check if SweetAlert2 is loaded
                    Swal.fire({
                        icon: 'success',
                        title: response.message,
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true
                    });
                } else {
                    console.error('SweetAlert2 is not loaded');
                    alert(response.message); // Fallback to native alert
                }

                // Update total items and subtotal in cart
                $('.total_cart_items').text(response.total_cart_items);
                $('.cart_sub_total').text(response.cart_sub_total);

                // Hide the deleted item
                $('.item_div_' + item_id).addClass('d-none');
            },
            error: function(xhr) {
                // Revert button on error
                button_el.html(original_button_html).prop('disabled', false);

                // Show error toast
                if (typeof Swal !== 'undefined') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error deleting item',
                        text: xhr.responseJSON?.error || 'Something went wrong',
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000
                    });
                } else {
                    console.error('Error:', xhr.responseJSON?.error || 'Request failed');
                    alert('Error deleting item');
                }
            },
            complete: function() {
                // Ensure button is always reverted after request completes
                button_el.html(original_button_html).prop('disabled', false);
            }
        });
    });
});