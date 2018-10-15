<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title></title>

<%--bootstrap css--%>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">

<%--bootstrap js--%>
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- minified jQuery -->
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<%--jquery js--%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

</head>
<body>
	<hr />
	<hr />
	<hr />
	<form role="form" id="mathForm" onsubmit="return false;">
		<div class="row">
			<div class="col-md-4 col-md-offset-5">
				<div class="form-group">BASIT MATEMATIKSEL ISLEMLER</div>
			</div>
			<div class="col-md-1 col-md-offset-5">
				<div class="form-group">
					<input type="text" id="firstNum" name="firstNum"
						class="form-control" placeholder="ilk sayi">
				</div>
				<div class="form-group">
					<input type="text" id="secNum" name="secNum" class="form-control"
						placeholder="ikinci sayi">
				</div>
				<div class="form-group">
					<input type="text" id="opResult" class="form-control"
						placeholder="Sonuc" readonly>
				</div>
			</div>
			<div class="col-md-12 col-md-offset-5">
				<button type="submit" disabled id="topla" class="btn btn-default">Topla</button>
				<button type="submit" disabled id="cikar" class="btn btn-default">Cikar</button>
				<button type="submit" disabled id="carp" class="btn btn-default">Carp</button>
				<button type="submit" disabled id="bol" class="btn btn-default">Bol</button>
			</div>
		</div>
	</form>

	<script>
    $(document).ready(function () {
        //alert("yepp");

        function checkNumberIsTrue() {
            var firstNum = $("#firstNum").val();
            var secNum = $("#secNum").val();

            if ($.isNumeric(firstNum) && $.isNumeric(secNum)) { //değerler numerikse butonları aktif et
                $("button").attr("disabled", false);

                if (secNum == 0) {//ikinci sayı sıfı ise bölme işlemi yapılmasın
                    $("#bol").attr("disabled", true);
                } else { //sıfır değilse bölme işlemi yapılsın
                    $("#bol").attr("disabled", false);
                }

            } else {///numerik değilse butonları pasif yap
                $("button").attr("disabled", true);
            }

        }//checkNumberIsTrue finish


        //ilk değer değişirse değerini kontrol et
        $("#firstNum").on("change", function () {
            checkNumberIsTrue();
        })//change finish

        //ikinci değer değişirse kontrolleri yap
        $("#secNum").on("change", function () {
            checkNumberIsTrue();
        })//change finish


        function ajaxPost(url, data) {
            $.ajax({
                type: "post",
                dataType: "json",
                url: url,
                data: data,
                success: function (result) {
                    $("#opResult").val(result["result"]);//sonucu yazdır
                }//success finish
            });
        }


        function formValues() {//form değerlerini al
            var formValues = $("#mathForm").serialize();
            return formValues;
        }

        //toplama işlemi yap
        $("#topla").on("click", function () {
            var data = formValues();
            var url = "http://localhost:8080/topla.html";
            ajaxPost(url, data)
        });//click finish

        //çıkarma işlemi yap
        $("#cikar").on("click", function () {
            var data = formValues();
            var url = "http://localhost:8080/cikar.html";
            ajaxPost(url, data)
        });//click finish


        //carpma işlemi yap
        $("#carp").on("click", function () {
            var data = formValues();
            var url = "http://localhost:8080/carp.html";
            ajaxPost(url, data)
        });//click finish


        //bölme işlemi yap
        $("#bol").on("click", function () {
            var data = formValues();
            var url = "http://localhost:8080/bol.html";
            ajaxPost(url, data)
        });//click finish



    });
</script>

</body>
</html>
