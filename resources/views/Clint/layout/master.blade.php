<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-16" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Farm</title>
    <link rel="stylesheet" href="{{asset('client/css/style.css')}}" />
    <link rel="stylesheet" href="{{asset('client/css/bootsrtap/bootstrap.css')}}" />
  </head>
  <body dir="rtl">
    <!-- Start Head and Nav  -->
    @include('Clint.Incloude.hedar')
<!-- End Head and Nav  -->

    <!-- Start Content  -->
    <!-- Start Content  -->
    @yield('content')
    <!-- End Content  -->
    <!-- End Content  -->

    <!-- Start Footer  -->
    @include('Clint.Incloude.Footer')

    <!-- End Footer  -->

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
