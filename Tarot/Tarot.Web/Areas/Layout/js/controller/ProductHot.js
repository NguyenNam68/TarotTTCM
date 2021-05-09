var hot = {
    init: function () {
        hot.registerEvents();
    },
    registerEvents: function () {
        $('.btn-hot').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/ProductAdmin/ChangeHot",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.hot == true) {
                        btn.text('HOT');
                    }
                    else {
                        btn.text('Không');
                    }
                }
            });
        });
    }
}
hot.init();