var cart = {
    init: function () {
        cart.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/CartAdmin/CheckOrder",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status == true) {
                        btn.text('Đã xử lý');
                    }
                    else {
                        btn.text('Chưa xử lý');
                    }
                }
            });
        });
    }
}
cart.init();