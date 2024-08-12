<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Big Cart</title>
    <link rel="stylesheet" href="{{asset('clients/css/style.css')}}" />
    <link rel="stylesheet" href="{{asset('clients/css/bootsrtap/bootstrap.css')}}" />
    <link rel="stylesheet" href="{{asset('clients/css/bootsrtap/bootstrap.min.css')}}" />
  </head>
  <body dir="rtl">

<!-- Start Head and Nav  -->
@include('Clint.Incloude.hedar')
<!-- End Head and Nav  -->

    <!-- Start Content  -->
    @yield('content')
    <!-- End Content  -->
    <!-- Start Script  -->
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const navLinks = document.querySelectorAll(".header .nav a");
        const currentUrl = window.location.href;

        navLinks.forEach((link) => {
          if (link.href === currentUrl) {
            link.classList.add("active");
          }
        });
      });
    </script>
    <!-- End Script  -->
  </body>
</html>
