var store = {
    init: function () {
        store.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/StoreAdmin/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status == true) {
                        btn.text('Mở cửa');
                    }
                    else {
                        btn.text('Đóng cửa');
                    }
                }
            });
        });
    }
}
store.init();
