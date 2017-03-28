angular.module('vendimia.routes', [])

  .config(function ($stateProvider, $urlRouterProvider) {

    $stateProvider

      .state('ventas', {
        url: '/ventas',
        templateUrl: 'assets/templates/ventas.html',
        controller: 'ControllerVenta'
      })

      .state('configuracion', {
        url: '/configuracion',
        templateUrl: 'assets/templates/configuracion.html',
        controller: 'ControllerConfig'
      })

      .state('clientes', {
        url: '/clientes',
        templateUrl: 'assets/templates/clientes.html',
        controller: 'ControllerClientes'
      })

      .state('articulos', {
        url: '/articulos',
        templateUrl: 'assets/templates/articulos.html',
        controller: 'ControllerArticulos'
      })


    $urlRouterProvider.otherwise('/ventas')

  });