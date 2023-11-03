<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/main.css" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <title>CoverYou</title>
</head>

<body>
<div class="payment-content">
    <div class="container">
        <div class="row">
            <div class="payment-info col-md-6">
                <div class="title-info">
                    <!-- Xu ly với jsp de lay ten nguoi dung -->
                    <h2>Hi, Vo Huu Tai</h2>
                    <h4>Total orders (0 product): 0 vnd</h4>
                </div>
                <h3>Shipping information</h3>
                <div class="customer-info-block">
                    <div class="row">
                        <div class="payment-info-details col-6">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="floatingInput1" placeholder="name@example.com">
                                <label for="floatingInput">Full name</label>
                            </div>
                        </div>
                        <div class="payment-info-details col-6">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="floatingInput2" placeholder="name@example.com">
                                <label for="floatingInput">Number Phone</label>
                            </div>
                        </div>
                    </div>
                    <div class="payment-info-details row">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput3" placeholder="name@example.com">
                            <label for="floatingInput">Email</label>
                        </div>
                    </div>
                    <div class="payment-info-details row">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Home address (Ex: 100 Le Van Viet)</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <select class="form-select form-select-sm mb-3 col-md-4" id="city" aria-label=".form-select-sm">
                                <option value="" selected>Select city</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select class="form-select form-select-sm mb-3 col-md-4" id="district" aria-label=".form-select-sm">
                                <option value="" selected>Select district</option>
                            </select>
                        </div>
                        <div class="payment-info-details col-md-4">
                            <select class="form-select form-select-sm col-md-4" id="ward" aria-label=".form-select-sm">
                                <option value="" selected>Select ward</option>
                            </select>
                        </div>
                    </div>
                    <div class="payment-info-details row mt-5">
                        <button type="button" class="btn btn-outline-secondary">Payment</button>
                    </div>
                </div>
            </div>
            <div class="payment-items col-md-6">
                <div class="title-info-items">
                    <h3>Cart</h3>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Json lay thong tin xa, huyen, tinh -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function (result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Id);
        }
        citis.onchange = function () {
            district.length = 1;
            ward.length = 1;
            if(this.value != ""){
                const result = data.filter(n => n.Id === this.value);

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Id);
                }
            }
        };
        district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Id === citis.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }
            }
        };
    }
</script>
</body>