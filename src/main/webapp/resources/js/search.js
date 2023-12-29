function getSearchList() {
    $.ajax({
        type: 'GET',
        url: "/getSearchList",
        data: $("form[name=search-form]").serialize(),
        success: function (result) {
            // 테이블 초기화
            $('#storetable > tbody').empty();
            if (result.length >= 1) {
                result.forEach(function (item) {
                    str = '<tr>';
                    str += "<td>" + item.storeName + "</td>";
                    str += "</tr>";
                    $('#storetable').append(str);
                });
            }
        }
    });
}
 