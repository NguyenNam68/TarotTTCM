var online = {
    init: function () {
        online.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/OnlinePayingAdmin/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status == true) {
                        btn.text('Đang hoạt động');
                    }
                    else {
                        btn.text('Khóa');
                    }
                }
            });
        });
    }
}
online.init();
