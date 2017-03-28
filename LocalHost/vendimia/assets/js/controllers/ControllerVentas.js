app.controller('ControllerVenta', ['$scope', '$http', function (scope, $http) {
    scope.accion = '';
    scope.next = '';
    scope.sale = {
        enganche: null,
        bonificacion: null,
        total: null,
        quantity: [],
        totalpay: [],
        save: [],
        abono: [],
        articulos: [],
        cantidadArticulos: [],
        totalArticulos: []
    };
    scope.sales = [];
    scope.saleArticle = [];
    scope.Payments = [
        {
            index: 0,
            abono: 3
        },
        {
            index: 1,
            abono: 6
        },
        {
            index: 2,
            abono: 9
        },
        {
            index: 3,
            abono: 12
        }];

    scope.NewSale = function () {
        scope.accion = 'A';
    }

    scope.SaleNext = function () {
        var validation = true;
        if (!scope.sale.total || !scope.sale.selectedclient) {
            notification('Error', 'Los datos ingresados no son correctos, favor de verificar.', 'error');
            validation = false;
            return false;
        }
        angular.forEach(scope.saleArticle, function (value, key) {
            if (scope.sale.quantity) {
                if (scope.sale.quantity[key] == 0 || !scope.sale.quantity[key]) {
                    notification('Error', 'Los datos ingresados no son correctos, favor de verificar.', 'error');
                    validation = false;
                    return false;
                }
            }
            else {
                notification('Error', 'Los datos ingresados no son correctos, favor de verificar.', 'error');
                validation = false;
                return false;
            }
        });
        if (!validation) { return; }
        else {
            var countedprice = 0;
            scope.next = 'A';
            countedprice = scope.sale.total / (1 + ((scope.config.tasa * scope.config.plazo) / 100));
            scope.Pay(countedprice);
        }
    }

    scope.Pay = function (countedprice) {
        angular.forEach(scope.Payments, function (value, key) {
            scope.sale.totalpay[value.index] = countedprice * (1 + (scope.config.tasa * value.abono) / 100);
            scope.sale.abono[value.index] = scope.sale.totalpay[value.index] / value.abono;
            scope.sale.save[value.index] = scope.sale.total - scope.sale.totalpay[value.index];
        });

        scope.sale.abonosmensuales = 1;
    }

    scope.AddArticle = function (article) {
        if (article) {
            if (!scope.config) {
                notification('Advertencia', 'Porfavor llenar primero los datos de configuración para continuar.', 'warning');
                return false;
            }
            if (article.existencia > 0) {
                if (scope.saleArticle.indexOf(article) === -1) {
                    article.finalPrice = article.precio * (1 + (scope.config.tasa * scope.config.plazo) / 100);
                    scope.saleArticle.push(article);
                    setTimeout(function () { $("#quantity" + article.id_articulo).focus(); }, 0000);
                }
                else {
                    notification('Advertencia', 'Artículo agregado anteriormente, favor de verificar.', 'warning');
                }
            }
            else {
                notification('Error', 'El artículo seleccionado no cuenta con existencia, favor de verificar.', 'error');
            }
        }
        else {
            notification('Advertencia', 'Favor de seleccionar un artículo.', 'warning');
        }
    }

    scope.Close = function () {
        confirmation();
    }

    scope.GetImport = function (article, index) {
        if (scope.sale.quantity[index] > parseInt(article.existencia)) {
            scope.sale.quantity[index] = null;
            notification('Error', 'El artículo solo cuenta con ' + article.existencia + ' de existencia', 'error');
        }
        else {
            article.importe = article.finalPrice * scope.sale.quantity[index];
        }
        scope.BonusHitch(scope.Hitch(scope.DetailsAmount()));
        scope.TotalSale(scope.DetailsAmount());
    }

    scope.DetailsAmount = function () {
        var amount = 0;
        angular.forEach(scope.saleArticle, function (value, key) {
            amount += (!value.importe || value.importe == '0') ? amount = 0 : value.importe;
        });
        return amount;
    }

    scope.Hitch = function (amount) {
        scope.sale.enganche = (scope.config.enganche / 100) * amount;
        return scope.sale.enganche;
    }

    scope.BonusHitch = function (hitch) {
        scope.sale.bonificacion = hitch * ((scope.config.tasa * scope.config.plazo) / 100);
        return scope.sale.bonificacion;
    }

    scope.TotalSale = function (amount) {
        scope.sale.total = amount - scope.sale.enganche - scope.sale.bonificacion;
    }

    scope.DeleteSaleArticle = function (index) {
        (scope.sale.quantity) ? scope.sale.quantity[index] = null : '';
        scope.saleArticle.splice(scope.saleArticle.indexOf(index), 1);
        (scope.saleArticle.length > 0) ? '' : scope.next = '';;
        scope.BonusHitch(scope.Hitch(scope.DetailsAmount()));
        scope.TotalSale(scope.DetailsAmount());
    }

    scope.Save = function () {
        if (!scope.sale.abonosmensuales) {
            notification('Error', 'Debe seleccionar un plazo para realizar el pago de su compra', 'error');
            return;
        }
        scope.sale.id_venta = scope.LastIdSale;
        scope.sale.id_cliente = scope.sale.selectedclient.id_cliente;
        scope.sale.plazos = scope.Payments[scope.sale.abonosmensuales - 1].abono;
        angular.forEach(scope.saleArticle, function (value, key) {
            scope.sale.articulos[key] = value.id_articulo;
            scope.sale.cantidadArticulos[key] = value.existencia - parseInt(scope.sale.quantity[key]);
            scope.sale.totalArticulos[key] = parseInt(scope.sale.quantity[key]);
        });
        $.post(MainDir + "Database_controller/InsertSale", { model: scope.sale }, function (data) {
            if (data[0]['success'] == 1) {
                $('#cancelar').trigger('click');
                scope.Start();
                notification(data[0]['msg'].substr(0, 11), data[0]['msg'].substr(11, 50), 'success');
            }
            else {
                notification('Advertencia', 'Se ha producido un error en la base de datos.', 'warning');
            }
        });
    }

    scope.Cancel = function () {
        scope.next = '';
        scope.sale = [];
        scope.saleArticle = [];
        scope.LastIdSale = scope.LastIdSaleAux;
    }

    scope.Start = function () {
        $http.get(MainDir + "Database_controller/GetSales")
            .then(function (data) {
                if (data['data'].length > 0) {
                    scope.sales = data['data'];
                }
            });
        $http.get(MainDir + "Database_controller/GetClients")
            .then(function (data) {
                if (data['data'].length > 0) {
                    scope.clients = data['data'];
                }
            });
        $http.get(MainDir + "Database_controller/GetArticles")
            .then(function (data) {
                if (data['data'].length > 0) {
                    scope.articles = data['data'];
                }
            });
        $http.get(MainDir + "Database_controller/GetConfig")
            .then(function (data) {
                if (data['data'].length > 0) {
                    scope.config = {
                        tasa: data['data'][0]['tasa'],
                        enganche: data['data'][0]['enganche'],
                        plazo: data['data'][0]['plazo'],
                    };
                }
            });
        $http.get(MainDir + "Database_controller/GetLastIdSale")
            .then(function (data) {
                if (data['data'].length > 0) {
                    var folio = (!data['data'][0]['id_venta']) ? 1 : data['data'][0]['id_venta'];
                    scope.LastIdSaleAux = folio;
                    scope.LastIdSale = folio;
                }
            });
    }

    scope.Start();

}]);