

(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        } 
    });
    
    
   // Back to top button
   $(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
        $('.back-to-top').fadeIn('slow');
    } else {
        $('.back-to-top').fadeOut('slow');
    }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:1
            },
            992:{
                items:2
            },
            1200:{
                items:2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            },
            1200:{
                items:4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });

     $('.quantity button').on('click', function (e) {
        e.preventDefault(); // Ngăn hành vi mặc định

        let change = 0;
        const button = $(this);
        const input = button.closest('.quantity').find('input');
        let oldValue = parseFloat(input.val()) || 1; // Đảm bảo giá trị hợp lệ

        let newVal;
        if (button.hasClass('btn-plus')) {
            newVal = oldValue + 1;
            change = 1;
        } else {
            newVal = oldValue > 1 ? oldValue - 1 : 1;
            change = oldValue > 1 ? -1 : 0;
        }

        input.val(newVal);

        //set from index
    const index =input.attr("data-cart-detail-index")
   
    const el = document.getElementById(`cartDetails${index}.quantity`);

    $(el).val(newVal);

        // Lấy dữ liệu giá và id sản phẩm
        const price = parseFloat(input.attr('data-cart-detail-price')) || 0;
        const id = input.attr('data-cart-detail-id');

        // Cập nhật giá của sản phẩm hiện tại
        const priceElement = $(`p[data-cart-detail-id='${id}']`);
        if (priceElement.length) {
            const newPrice = price * newVal;
            priceElement.text(formatCurrency(newPrice) + " đ");
        }

        // Cập nhật tổng giá trị giỏ hàng
        const totalPriceElement = $("p[data-cart-total-price]");
        if (totalPriceElement.length) {
            const currentTotal = parseFloat(totalPriceElement.first().attr("data-cart-total-price")) || 0;
            const newTotal = currentTotal + (change * price);

            totalPriceElement.text(formatCurrency(newTotal) + " đ");
            totalPriceElement.attr("data-cart-total-price", newTotal);
        }
    });

    // Hàm định dạng tiền
    function formatCurrency(value) {
        const numValue = parseFloat(value);
        if (isNaN(numValue)) return "0";
        return new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            minimumFractionDigits: 0
        }).format(numValue);
    }

    



    

})(jQuery);