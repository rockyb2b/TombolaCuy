<!DOCTYPE html>
<html lang="en">
<head>
    <title>CuyTorito</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- SEO Meta -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- /SEO Meta -->
    <!-- OpenGraph meta -->
    <meta property="og:image" content="">
    <meta property="og:title" content="og title">
    <meta property="og:description" content="og description">
    <!-- /OpenGraph meta -->
    <!-- Favicon -->
    {{--<link rel="shortcut icon" href="../images/xampp.ico">--}}
    <link rel="shortcut icon" href="{{asset('images/logoat.png')}}">
    <link rel="apple-touch-icon" href="#">
    <link rel="apple-touch-icon" href="#" sizes="57x57">
    <link rel="apple-touch-icon" href="#" sizes="72x72">
    <link rel="apple-touch-icon" href="#" sizes="76x76">
    <link rel="apple-touch-icon" href="#" sizes="114x114">
    <link rel="apple-touch-icon" href="#" sizes="120x120">
    <link rel="apple-touch-icon" href="#" sizes="144x144">
    <link rel="apple-touch-icon" href="#" sizes="152x152">
    <link rel="apple-touch-icon" href="#" sizes="180x180">
    <!-- /AppleTouch Icons -->
    <!-- Styles -->
    <link rel="stylesheet" href="{{asset('../css/theme.css')}}">
    <link rel="stylesheet" href="{{asset('../components/toastr/toastr.min.css')}}">
    <!-- <link rel="stylesheet" href="{{asset('../components/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css')}}"> -->
    <!-- <link rel="stylesheet" href="{{asset('../components/select2/select2.min.css')}}" rel="stylesheet"/> -->
    <!-- <link rel="stylesheet" href="{{asset('../css/demo.css')}}"> -->
    <!-- <link rel="stylesheet" href="{{asset('../components/icheck/skins/all.css')}}"> -->
    <link rel="stylesheet" href="{{asset('../css/jquery.confirm.css')}}">
    <!-- /Styles -->
</head>
<body class="@yield('body-class','sidebar-style loaded expanded')">
<!-- {{--<body class="sidebar-style loaded">--}} -->
    <!-- MAIN CONTAINER -->
    <main class="main-container">
        <div class="content container-fluid">            
            @include('ClienteVista.ClienteVistaCajaTabla')
        </div>
    </main>
    <!-- SCRIPTS -->
    <script src="{{asset('../js/jquery-2.2.4.min.js')}}"></script>
    <script src="{{asset('../components/jquery-ui/jquery-ui.min.js')}}"></script>
    <script src="{{asset('../js/bootstrap.min.js')}}"></script>
    <script src="{{asset('../js/moment-with-locales.js')}}"></script>
    <script src="{{asset('../js/jquery.mCustomScrollbar.concat.min.js')}}"></script>
    <script src="{{asset('../js/jquery.stellar.min.js')}}"></script>
    <script src="{{asset('../js/jquery.magnific-popup.min.js')}}"></script>
    <script src="{{asset('../js/pnotify.custom.min.js')}}"></script>
    <script src="{{asset('../js/jquery.animateNumber.min.js')}}"></script>
    <script src="{{asset('../js/sweetalert.min.js')}}"></script>
    <script src="{{asset('../js/circle-progress.min.js')}}"></script>
    <script src="{{asset('../js/general.js')}}"></script>
    <script src="{{asset('../components/toastr/toastr.min.js')}}"></script>
    <script src="{{asset('../components/loadingoverlay/loadingoverlay.min.js')}}"></script>
    <script src="{{asset('../components/momentjs/moment_locales.min.js')}}"></script>
    <script src="{{asset('../assets/js/funciones.js')}}"></script>
    <script src="{{asset('../js/moment.js')}}"></script>
    <script src="{{asset('../js/jquery.confirm.js')}}"></script>

    <link rel="stylesheet" href="{{asset('../css/caja/estilos_caja.css')}}">

    <script src="{{asset('../assets/ClienteVista/ClienteVistaFunciones.js')}}"></script>
    <script src="{{asset('../assets/ClienteVista/ClienteVistaIndex.js')}}"></script>
    <?php if($error != ""){?>
        <script>toastr.error("<?php echo $error;?>");</script>
    <?php }?>
</body>
</html>