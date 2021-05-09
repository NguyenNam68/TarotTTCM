var feedback = {
    init: function () {
        feedback.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/FeedbackAdmin/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status == true) {
                        btn.text('Đã hồi đáp');
                    }
                    else {
                        btn.text('Chưa hồi đáp');
                    }
                }
            });
        });
    }
}
feedback.init();
