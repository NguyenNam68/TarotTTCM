var publisher = {
    init: function () {
        publisher.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/PublisherAdmin/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status == true) {
                        btn.text('Đang cung cấp');
                    }
                    else {
                        btn.text('Ngừng cung cấp');
                    }
                }
            });
        });
    }
}
publisher.init();
