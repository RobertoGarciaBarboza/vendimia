app.controller('ControllerClientes', ['$scope', '$http', function (scope, $http) {
    scope.accion = '';
    //scope.clients ={}
    scope.client = {
        nombre: '',
        apepaterno: '',
        apematerno: '',
        rfc: '',
    };

    scope.NewClient = function () {
        scope.accion = 'A';
    }

    scope.SaveClient = function () {
        $('input').removeClass('alert-input');
        if (!scope.formValid) {
            scope.CampoVacio = (!scope.client.nombre) ? 'Nombre' : (!scope.client.apepaterno) ? 'ApellidoPaterno' : (!scope.client.apematerno) ? 'ApellidoMaterno' : 'RFC';
            $("#" + scope.CampoVacio).addClass('alert-input');
            $("#" + scope.CampoVacio).focus();
            scope.CampoVacio = (scope.CampoVacio == 'ApellidoPaterno') ? 'Apellido Paterno' : (scope.CampoVacio == 'ApellidoMaterno') ? 'Apellido Materno' : scope.CampoVacio;
            notification('Error', 'No es posible continuar, debe ingresar ' + scope.CampoVacio + ' es obligatorio.', 'error');
        } else {
            $.post(MainDir + "Database_controller/InsertClient", { model: scope.client }, function (data) {
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
    }

    scope.Modify = function (index) {
        scope.accion = 'A';
        scope.client = scope.clients[index];
        scope.LastIdClient = scope.clients[index]['id_cliente'];
    }

    scope.Close = function () {
        confirmation();
    }

    scope.Cancel = function () {
        $('input').removeClass('alert-input');
        scope.client = {};
        scope.LastIdClient = scope.LastIdClientsAux;
    }

    scope.Start = function () {
        $http.get(MainDir + "Database_controller/GetClients")
            .then(function (data) {
                if (data['data'].length > 0) {
                    scope.clients = data['data'];
                }
            });
        $http.get(MainDir + "Database_controller/GetLastIdClient")
            .then(function (data) {
                if (data['data'].length > 0) {
                    var folio = (!data['data'][0]['id_cliente']) ? 1 : data['data'][0]['id_cliente'];
                    scope.LastIdClientsAux = folio;
                    scope.LastIdClient = folio;
                }
            });
    }

    scope.Start();
}]);