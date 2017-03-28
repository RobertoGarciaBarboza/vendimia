app.controller('ControllerConfig', ['$scope', '$http', function (scope, $http) {
    scope.date = new Date();
    scope.config = {
        tasa: '',
        enganche: '',
        plazo: '',
    }

    scope.SaveConfig = function () {
        $('input').removeClass('alert-input');
        if (!scope.formValid) {
            scope.CampoVacio = (!scope.config.tasa) ? 'Tasa ' : (!scope.config.enganche) ? 'Enganche' : 'Plazo';
            $("#" + scope.CampoVacio).addClass('alert-input');
            $("#" + scope.CampoVacio).focus();
            notification('Error', 'No es posible continuar, debe ingresar ' + scope.CampoVacio + ' es obligatorio.', 'error');
        } else {
            $.post(MainDir + "Database_controller/InsertConfig", { model: scope.config }, function (data) {
                scope.data = data;
                if (scope.data[0]['success'] == 1) {
                    $('#cancelar').trigger('click');
                    notification(scope.data[0]['msg'].substr(0, 11), scope.data[0]['msg'].substr(11, 45), 'success');
                }
                else {
                    notification('Advertencia', 'Se ha producido un error en la base de datos.', 'warning');
                }
            });
        }
    }

    scope.Cancel = function () {
        $('input').removeClass('alert-input');
        scope.config = {};
    }

    scope.Start = function () {
        $http.get(MainDir + "Database_controller/GetConfig")
            .then(function (data) {
                if(data['data'].length>0){
                    scope.config = {
                        tasa: data['data'][0]['tasa'],
                        enganche: data['data'][0]['enganche'],
                        plazo: data['data'][0]['plazo'],
                    };
                }
            });
    }

    scope.Start();

}]);