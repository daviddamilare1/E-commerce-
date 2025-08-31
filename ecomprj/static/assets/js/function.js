console.log('Working...');

$(document).ready(function() {
    const Toast = Swal.mixin({
    toast: true,
    position: 'top',
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true
    });

    // Generate or retrieve cart ID
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

    // Update button states based on localStorage (add to cart)
    function updateButtonStates() {
        const cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
        $('.add_to_cart').each(function() {
            const button_el = $(this);
            const id = button_el.attr('data-id');
            // Reset to default state
            button_el.html('Add to cart <i class="fas fa-shopping-cart ms-2"></i>');
            if (cartItems.includes(id)) {
                button_el.html('Added to cart <i class="fas fa-shopping-cart ms-2"></i>');
            }
        });
    }


    // Sync button states with server-side cart
    function syncButtonStatesWithServer() {
        const cart_id = generateCartId();
        $.ajax({
            url: '/get_cart_items/',
            data: { cart_id: cart_id },
            success: function(response) {
                // Ensure cartItems is an array of strings
                const cartItems = response.cart_items.map(String);
                // Update localStorage with server-side cart items
                localStorage.setItem('cartItems', JSON.stringify(cartItems));
                // Update button states
                updateButtonStates();
            },
            error: function(xhr) {
                console.log('Failed to fetch cart items:', xhr.status, xhr.responseText);
                // Fallback to localStorage if server call fails
                updateButtonStates();
            }
        });
    }


    // Call on page load
    syncButtonStatesWithServer();
// ########################################################################
    
 


    



    // Add to cart function
    $(document).on('click', '.add_to_cart', function(e) {
        e.preventDefault();
        const button_el = $(this);
        const id = button_el.attr('data-id');
        // Determine if the button is in the main product section or related products
        const isMainProduct = button_el.closest('.prt_05').length > 0;
        // Get quantity from the closest container
        const qty = button_el.closest('.prt_05, .product_grid').find('.quantity').val() || 1;
        // Only get color and size for the main product
        const size = isMainProduct ? $('input[name="size"]:checked').val() || '' : '';
        const color = isMainProduct ? $('input[name="color"]:checked').val() || '' : '';
        const cart_id = generateCartId();
        

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
                Toast.fire({
                    icon: 'success',
                    title: response.message,
                });
                // Update button state
                button_el.html('Added to cart <i class="fas fa-shopping-cart ms-2"></i>');

                // Update localStorage with the added item
                let cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
                if (!cartItems.includes(id)) {
                    cartItems.push(id);
                    localStorage.setItem('cartItems', JSON.stringify(cartItems));
                }

                // Update total items in cart for both desktop and mobile
                $('.total_cart_items, .mobile_nav .dn-counter').text(response.total_cart_items);
            },
            error: function(xhr, status, error) {
                console.log('Error Status:', xhr.status);
                console.log('Response Text:', xhr.responseText);
                let errorResponse;
                try {
                    errorResponse = JSON.parse(xhr.responseText);
                } catch (e) {
                    errorResponse = { error: 'An error occurred' };
                }
                Toast.fire({
                    icon: 'error',
                    title: errorResponse.error,
                });
                // Revert button state on error
                button_el.html('Add to cart <i class="fas fa-shopping-cart ms-2"></i>');
            }
        });
    });







    // Update cart function
    $(document).on('click', '.update_cart_qty', function(e) {
        e.preventDefault();
        e.stopPropagation();

        const button_el = $(this);
        const update_type = button_el.attr('data-update_type');
        const item_id = button_el.attr('data-item_id');
        const product_id = button_el.attr('data-product_id');
        let qty = $('.item-qty-' + item_id).val();
        const cart_id = generateCartId();
        // Get color and size from the cart item's HTML
        const color = $('.item_div_' + item_id).find('.color').text().replace('Color: ', '').trim();
        const size = $('.item_div_' + item_id).find('.size').text().replace('Size: ', '').trim();
        const original_button_html = button_el.html(); // Store original button HTML

        if(update_type === 'increase'){
            $('.item-qty-' + item_id).val(parseInt(qty) + 1);
            qty++;
        } else {
            if (parseInt(qty) <= 1){
                $('.item-qty-' + item_id).val(1);
                qty = 1;

            } else {
                $('.item-qty-' + item_id).val(parseInt(qty) - 1);
                qty --;

            }
        }

        $.ajax({
            url: '/add_to_cart/',
            data: {
                id: product_id,
                qty: qty,
                cart_id: cart_id,
                color: color,
                size:size,
            },
            beforeSend: function() {
                button_el.html('<i class="fas fa-spinner fa-spin ms-2"></i>');
            },
            success: function(response) {
                console.log(response);
                
                Toast.fire({
                    icon: 'success',
                    title: response.message,
                });
                
                if (update_type === 'increase'){
                    button_el.html('+');
                } else {
                    button_el.html('-');
                }

                $('.item_sub_total_' + item_id).text(response.item_sub_total);
                $('.cart_sub_total').text(response.cart_sub_total);

                // Update total items in cart for both desktop and mobile
                $('.total_cart_items, .mobile_nav .dn-counter').text(response.total_cart_items);

            },
            error: function(xhr, status, error) {
                console.log('Error Status:', xhr.status);
                console.log('Response Text:', xhr.responseText);
                let errorResponse;
                try {
                    errorResponse = JSON.parse(xhr.responseText);
                } catch (e) {
                    errorResponse = { error: 'An error occurred' };
                }
                Toast.fire({
                    icon: 'error',
                    title: errorResponse.error,
                });
                
                if (update_type === 'increase'){
                    button_el.html('+');
                } else {
                    button_el.html('-');
                }
            }
        });

    });







    // Delete Cart Item function
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

               // Update total items and subtotal in cart for both desktop and mobile
                $('.total_cart_items, .mobile_nav .dn-counter').text(response.total_cart_items);
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





    

        // Add to Wishlist function
    $(document).on('click', '.add_to_wishlist', function() {
        const button_el = $(this);
        const product_id = button_el.attr('data-product_id');
        const is_in_wishlist = button_el.attr('data-in_wishlist') === 'true';

        if (!product_id || isNaN(product_id)) {
            Toast.fire({
                icon: 'error',
                title: 'Invalid product ID',
            });
            return;
        }

        console.log('Product ID:', product_id, 'In Wishlist:', is_in_wishlist);

        $.ajax({
            url: `/customer/add_to_wishlist/${product_id}/`,
            method: 'POST',
            headers: { 'X-CSRFToken': getCookie('csrftoken') },
            data: { action: is_in_wishlist ? 'remove' : 'add' },
            beforeSend: function() {
                button_el.html('<i class="fas fa-spinner fa-spin ms-2"></i>').prop('disabled', true);
            },
            success: function(res) {
                button_el.html(`<i class="fas fa-heart fs-4" style="color: ${res.in_wishlist ? 'red' : 'grey'}"></i>`).prop('disabled', false);
                button_el.attr('data-in_wishlist', res.in_wishlist ? 'true' : 'false');
                $('.total_wishlist_items').text(res.wishlist_count); // Update wishlist count
                Toast.fire({
                    icon: res.message.includes('Login') ? 'warning' : (res.in_wishlist ? 'success' : 'info'),
                    title: res.message,
                });
                console.log('Success:', res);
            },
            error: function(xhr) {
                button_el.html(`<i class="fas fa-heart fs-4" style="color: ${is_in_wishlist ? 'red' : 'grey'}"></i>`).prop('disabled', false);
                Toast.fire({
                    icon: 'error',
                    title: 'Failed to update wishlist. Please try again.',
                });
                console.error('Error:', xhr.status, xhr.responseText);
            }
        });
    });

    // Function to get CSRF token from cookies
    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }

















    // Assuming this is part of your payment success callback
    function handlePaymentSuccess() {
        $.ajax({
            url: '/clear_cart/',
            method: 'GET',
            success: function(response) {
                // Clear localStorage cartItems
                localStorage.removeItem('cartItems');
                // Regenerate a new cart ID to avoid reusing the old one
                localStorage.removeItem('cartId');
                // Update button states to reflect empty cart
                updateButtonStates();
                Toast.fire({
                    icon: 'success',
                    title: response.message,
                });
                // Update total items in cart for both desktop and mobile
                $('.total_cart_items, .mobile_nav .dn-counter').text(0);
            },
            error: function(xhr) {
                Toast.fire({
                    icon: 'error',
                    title: 'Failed to clear cart',
                });
            }
        });
    };









});