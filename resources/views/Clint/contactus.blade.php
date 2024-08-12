<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-16" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>التقارير | Big Cart</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/bootsrtap/bootstrap.css" />
    <link rel="stylesheet" href="css/bootsrtap/bootstrap.min.css" />
  </head>
  <body dir="rtl">
@include('Clint.Incloude.hedar')
@section('content')


    <!-- Start Contact Us -->
    <div class="contt">
        <div class="container">
          <div class="row contact_form">
            <h2 class="display-6 text-center fw-bold">تواصل معنا</h2>
            <form action="">
              <div class="contact_field col-12">
                <input type="text" name="" id="" placeholder="الاسم كامل" />
              </div>
              <div class="contact_field">
                <input type="email" name="" id="" placeholder="الإيميل" />
              </div>
              <div class="contact_field">
                <textarea name="" id="" placeholder="طلبك"></textarea>
              </div>
              <div>
                <input
                  type="submit"
                  value="إرسال"
                  name=""
                  class="btn btn-success text-light contact_button"
                />
              </div>
              <div class="contact_icon">
                <a href="">
                  <img src="images/bootstrap-icons-1.11.3/twitter-x.svg" alt="" />
                </a>
                <a href="">
                  <img src="images/bootstrap-icons-1.11.3/instagram.svg" alt="" />
                </a>
                <a href="">
                  <img src="images/bootstrap-icons-1.11.3/facebook.svg" alt="" />
                </a>
              </div>
  
              <label for="" class="copyright">bigcart@green.com</label>
            </form>
          </div>
        </div>
      </div>
      <!-- End Contact Us -->

@include('Clint.Incloude.Footer')
@endsection