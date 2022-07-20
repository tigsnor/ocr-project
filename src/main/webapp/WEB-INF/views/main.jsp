<%@page contentType="text/html; charset=UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <title>Document</title>
</head>
<script>
// var result = {
//     "img":"data:image/jpeg;base64,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",
//     "words":[
//         {
//             "text":"업계 1위",
//             "w":4,
//             "h":3,
//             "x":2,
//             "y":2
//         },
//         {
//             "text":"업계 2위",
//             "w":4,
//             "h":3,
//             "x":2,
//             "y":2
//         },
//         {
//             "text":"업계 3위",
//             "w":4,
//             "h":3,
//             "x":2,
//             "y":2
//         },
//         {
//             "text":"업계 4위",
//             "w":4,
//             "h":3,
//             "x":2,
//             "y":2
//         },
//         {
//             "text":"업계 5위",
//             "w":4,
//             "h":3,
//             "x":2,
//             "y":2
//         },
//         {
//             "text":"업계 6위",
//             "w":4,
//             "h":3,
//             "x":2,
//             "y":2
//         }
//     ]
// }

$(()=> {
    $(function () {
        $("#fileSubmit").on("click", function () {

            var form = $('#imgf')[0].files[0];
            var formData = new FormData();

            formData.append('test', form);

            // axios.post('http://192.168.0.141:8000/ocr/', formData, {
            //     withCredentials: true,
            //     headers: {
            //         'Content-Type': 'multipart/form-data'
            //     }
            // }).then(res=>{
            //     result = res
            //     $("#resultImg").attr("src", result.img)
            //     var tbResult = "";
            //
            //     for (i=0; i < result.words.length; i++){
            //         console.log(1)
            //         console.log(result.words[i].text);
            //         var content = result.words[i].text;
            //         tbResult += "<tr><td>텍스트"+(i+1)+" : "+content+"</td></tr>";
            //     }
            //     console.log(tbResult)
            //
            //     $("#resultTable").html(
            //         tbResult
            //     )
            //
            //
            // })


            // if ($("#imgf").value == "") {
            //     alert("이미지를 첨부하세요");
            //     form.imgf.focus();
            //     return false;
            // }

                $.ajax({
                    url: "http://192.168.0.141:8000/ocr/",
                    type: "post",
                    enctype: 'multipart/form-data',
                    data: formData,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (response) {
                        alert("성공하였습니다.");
                        response =JSON.parse(response)
                        console.log(response.img.replace("b,",""));
                        console.log(response.words);
                        // result = response
                        $("#resultImg").attr("src", "data:image/jpeg;base64,"+response.img.replace("b'","").replace("'",""))
                        var tbResult = "";

                        for (i=0; i < response.words.length; i++){
                            console.log(1)
                            console.log(response.words[i].text);
                            var content = response.words[i].text;
                            tbResult += "<tr><td>텍스트"+(i+1)+" : "+content+"</td></tr>";
                        }
                        console.log(tbResult)

                        $("#resultTable").html(
                            tbResult
                        )
                    }, error: function (jqXHR) {
                        alert("실패");
                    }
                });
            // $("#requestBtn").on("click", function () {
            //     $.post("http://192.168.0.141:8000/ocr/"),
            //         {test: "test123"},
            //         function (data, status) {
            //             $("#text").html(data + "<br>" + status);
            //         }
            // })
        })
    })
})
</script>
<body>

<div class="jumbotron text-center">
    <h1>이투온 OCR 구현</h1>
</div>

<div class="container" align="center">

<%--    <form action="http://192.168.0.141:8000/ocr/" method="post" enctype="multipart/form-data">--%>
<%--        <div align="center">--%>
<%--            <input type="file" id="imgf" name="test">--%>
<%--            <input type="submit" id="fileSubmit" value="업로드하기">--%>
<%--        </div>--%>
<%--    </form>--%>

    <div>
        <input type="file" id="imgf">
        <input type="submit" id="fileSubmit" value="분석하기" class="btn btn-primary">
    </div>

    <div style="margin-top: 20px">
        <div class="table-responsive" >
            <table>
                <tr>
                    <td>
                        <img class="rounded" id="resultImg">
                    </td>
                    <td>
                        <div style="width: 100%; height: 200px;overflow: auto">
                        <table class="table" id="resultTable" width="100%" border="0" cellpadding="0" cellspacing="0">
                        </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>