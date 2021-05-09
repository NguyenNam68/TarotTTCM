var productTag = {
    init: function () {
        productTag.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/ProductTagAdmin/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status == true) {
                        btn.text('Hoạt động');
                    }
                    else {
                        btn.text('Khóa');
                    }
                }
            });
        });
    }
}
productTag.init();
