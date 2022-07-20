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
                    },
                    beforeSend: function () {
                                     
                        var width = 0;             
                        var height = 0;             
                        var left = 0;             
                        var top = 0;
                        width = 50;             
                        height = 50;
                        top = ( $(window).height() - height ) / 2 + $(window).scrollTop();             
                        left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

                        if($("#div_ajax_load_image").length != 0) {                    
                            $("#div_ajax_load_image").css({                           
                                "top": top+"px",                           
                                "left": left+"px"                    
                            });                    
                            $("#div_ajax_load_image").show();             
                        }              else {                    
                            $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="../resources/loading.gif" style="width:50px; height:50px;"></div>');              }
                    }      
                    , complete: function () {                    
                        $("#div_ajax_load_image").hide();      
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