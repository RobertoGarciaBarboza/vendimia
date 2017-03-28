app.controller('ControllerArticulos', ['$scope', '$http', function (scope, $http) {
    scope.accion = '';
    //scope.articles = {};
    scope.article = {
        descripcion: '',
        modelo: '',
        precio: '',
        existencia: '',
    };

    scope.NewArt = function () {
        scope.accion = 'A';
    }

    scope.SaveArticle = function () {
        $('input').removeClass('alert-input');
        if (!scope.formValid) {
            scope.CampoVacio = (!scope.article.descripcion) ? 'Descripción ' : (!scope.article.modelo) ? 'Modelo' : (!scope.article.precio) ? 'Precio' : 'Existencia';
            $("#" + scope.CampoVacio).addClass('alert-input');
            $("#" + scope.CampoVacio).focus();
            notification('Error', 'No es posible continuar, debe ingresar ' + scope.CampoVacio + ' es obligatorio.', 'error');
        } else {
            $.post(MainDir + "Database_controller/InsertArticle", { model: scope.article }, function (data) {
                if (data[0]['success'] == 1) {
                    $('#cancelar').trigger('click');
                    scope.Start();
                    notification(data[0]['msg'].substr(0, 11), data[0]['msg'].substr(11, 46), 'success');
                }
                else {
                    notification('Advertencia', 'Se ha producido un error en la base de datos.', 'warning');
                }
            });
        }
    }

    scope.Close = function () {
        confirmation();
    }

    scope.Cancel = function () {
        $('input').removeClass('alert-input');
        scope.article = {};
        scope.LastIdArticles = scope.LastIdArticlesAux;
    }

    scope.Modify = function (index) {
        scope.accion = 'A';
        scope.article = scope.articles[index];
        scope.LastIdArticles = scope.articles[index]['id_articulo'];
    }

    scope.Start = function () {
        $http.get(MainDir + "Database_controller/GetArticles")
            .then(function (data) {
                if (data['data'].length > 0) {
                    scope.articles = data['data'];
                }
            });
        $http.get(MainDir + "Database_controller/GetLastIdArticles")
            .then(function (data) {
                if (data['data'].length > 0) {
                    var folio = (!data['data'][0]['id_articulo']) ? 1 : data['data'][0]['id_articulo'];
                    scope.LastIdArticlesAux = folio;
                    scope.LastIdArticles = folio;
                }
            });
    }

    scope.Start();
}]);