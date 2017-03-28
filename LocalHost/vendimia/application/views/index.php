<!DOCTYPE html>
<html lang="en" ng-app="vendimia">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="<?php echo base_url();?>/assets/imgs/vendimia.png" type="image/x-icon">
  <title>La Vendimia</title>    
  <!--******************* Css ********************-->
  <link href="<?php echo base_url();?>/assets/css/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="<?php echo base_url();?>/assets/css/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" >
  <link href="<?php echo base_url();?>/assets/css/plugins/hint-2.0/css/hint.min.css" rel="stylesheet">
  <link href="<?php echo base_url();?>/assets/css/plugins/notify-2.0/css/pnotify.custom.min.css" rel="stylesheet">
  <link href="<?php echo base_url();?>/assets/css/plugins/angular-1.6/css/select.min.css" rel="stylesheet">
  <link href="<?php echo base_url();?>/assets/css/style.css" rel="stylesheet">
  <!--******************* NavBar ********************-->
    <div id="navbar" ng-controller="ControllerNav">    
      <nav class="navbar navbar-default navbar-static-top" id="NavStyle" role="navigation">
        <div class="navbar-header">
          <a class="navbar-brand" href=".">
            <img src="<?php echo base_url();?>/assets/imgs/vendimia.png">
          </a>
          <a class="navbar-brand tittle" href=".">La Vendimia</a>
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a class="dropdown-toggle tittleMenu" data-toggle="dropdown">Inicio <b class="caret"></b></a> 
                <ul class="dropdown-menu">
                  <li><a href=".">Ventas</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a ui-sref="clientes">Clientes</a></li>
                  <li><a ui-sref="articulos">Articulos</a></li>
                  <li><a ui-sref="configuracion">Configuración</a></li>                                            
                </ul>
            </li>
          </ul>
          <p class="navbar-text navbar-right navbar-date">Fecha: {{date | date:'dd-MM-yyyy'}}</p>
        </div>
      </nav>
    </div>
</head>

<body>    
    <div ui-view>
    </div>

    <!--******************* Scripts ********************-->
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/plugins/jquery-1.12.4/js/jquery.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/plugins/angular-1.6/js/angular.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/plugins/angular-1.6/js/angular-ui-router.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/plugins/angular-1.6/js/select.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/plugins/angular-1.6/js/angular-sanitize.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/plugins/notify-2.0/js/pnotify.custom.min.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/app.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/routes.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/directives.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/controller.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/general.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/controllers/ControllerNav.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/controllers/ControllerVentas.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/controllers/ControllerClientes.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/controllers/ControllerArticulos.js"></script>
  <script type="text/javascript" src="<?php echo base_url();?>/assets/js/controllers/ControllerConfiguracion.js"></script>
</body>

</html>