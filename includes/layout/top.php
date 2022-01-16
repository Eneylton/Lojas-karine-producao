<?php

use \App\Session\Login;

$usuariologado = Login::getUsuarioLogado();

$acesso = $usuariologado['acessos_id'];

$usuario = $usuariologado ?

  '<a href="../../logout.php" class="nav-link"> <i class="fas fa-power-off" style="font-size:16px"></i></a>' :
  'Visitante: <a href="login.php" class="text-light font-weigth-bold ml-2">Entrar</a>'

?>

<body class="hold-transition sidebar-closed sidebar-collapse layout-fixed layout-navbar-fixed layout-footer-fixed">
  <div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-dark  ">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="../../index.php" class="nav-link">Home</a>
        </li>

        <li class="<?php

                    switch ($acesso) {
                      case '2':
                        echo "nav-item d-none d-sm-inline-block";
                        break;
                      case '3':
                        echo "";
                        break;
                      case '4':
                        echo "";
                        break;

                      default:
                        echo "nav-item d-none d-sm-inline-block";
                        break;
                    }

                    ?>" style="display: none;">
          <a href="../../pages/categorias/categoria-list.php" class="nav-link">Categorias</a>
        </li>
        <li class="<?php

                    switch ($acesso) {
                      case '2':
                        echo "nav-item d-none d-sm-inline-block";
                        break;
                      case '3':
                        echo "";
                        break;
                      case '4':
                        echo "";
                        break;

                      default:
                        echo "nav-item d-none d-sm-inline-block";
                        break;
                    }

                    ?>" style="display: none;">
          <a href="../../pages/produtos/produto-list.php" class="nav-link">Produtos</a>
        </li>

        <li class="<?php

                    switch ($acesso) {
                      case '2':
                        echo "nav-item d-none d-sm-inline-block";
                        break;
                      case '3':
                        echo "";
                        break;
                      case '4':
                        echo "";
                        break;

                      default:
                        echo "nav-item d-none d-sm-inline-block";
                        break;
                    }

                    ?>" style="display: none;">
          <a href="../../pages/caixa/caixa-list.php" class="nav-link">Caixa</a>
        </li>

      




      </ul>

      <!-- SEARCH FORM -->
      <form class="form-inline ml-3">
        <div class="input-group input-group-sm">
          <input class="form-control form-control-navbar" type="search" placeholder="Pesquisar" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-navbar" type="submit">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
      </form>

      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto">
        <!-- Messages Dropdown Menu -->

        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="far fa-comments"></i>
            <span class="badge badge-danger navbar-badge">3</span>
          </a>
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="far fa-bell"></i>
            <span class="badge badge-warning navbar-badge">15</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <span class="dropdown-item dropdown-header">15 Notifications</span>
          </div>
        </li>
        </a>
        <li class="nav-item dropdown">
          <?= $usuario ?>

        </li>
        <li class="nav-item">
          <a class="nav-link" data-widget="fullscreen" href="#" role="button">
            <i class="fas fa-expand-arrows-alt"></i>
          </a>
        </li>

        </li>

      </ul>
    </nav>
    <!-- /.navbar -->