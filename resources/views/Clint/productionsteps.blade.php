<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>تتبع المنتجات | Big Cart</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/bootsrtap/bootstrap.css" />
    <link rel="stylesheet" href="css/bootsrtap/bootstrap.min.css" />
  </head>
  @include('Clint.Incloude.hedar')
@section('content')

    <!-- Start Production Steps -->
    <section class="container text-center production_section">
        <div>
          <input
            type="text"
            value="تتم الزراعة"
            class="m-5 production_field_display"
            readonly
          />
          <label style="font-weight: bold; font-size: 43px; margin-right: -52px"
            >ـــــــــــــــ</label
          ><img
            src="images/bootstrap-icons-1.11.3/circle-fill.svg"
            style="margin-left: -50px"
          />
          <input
            type="text"
            value="يتم الاعتناء بالزرع"
            class="m-5 production_field_display"
            readonly
          />
          <label style="font-weight: bold; font-size: 43px; margin-right: -52px"
            >ـــــــــــــــ</label
          ><img
            src="images/bootstrap-icons-1.11.3/circle-fill.svg"
            style="margin-left: -50px"
          />
          <input
            type="text"
            value="يتم الحصاد "
            class="m-5 production_field_display"
            readonly
          />
          <label
            for=""
            style="font-weight: bold; font-size: 43px; margin-right: -52px"
            >ــــ
          </label>
          <div style="margin-right: 810px; margin-top: -130px">
            <label style="font-weight: bold; font-size: 43px; margin-top: 50px"
              >|</label
            >
            <br />
            <label style="font-weight: bold; font-size: 43px; margin-top: -25px"
              >|</label
            >
          </div>
        </div>
        <div style="margin-right: 818px; margin-top: -30px">
          <label style="font-weight: bold; font-size: 43px; margin-right: -8px"
            >|</label
          >
        </div>
        <div class="production_section2" style="margin-top: -75px">
          <label
            for=""
            style="font-weight: bold; font-size: 43px; margin-right: -53px"
            >ــــ
          </label>
          <input
            type="text"
            value="يتم التغليف "
            class="m-5 production_field_display"
            readonly
          />
          <label style="font-weight: bold; font-size: 43px; margin-left: -50px"
            >ـــــــــــــــ</label
          ><img
            src="images/bootstrap-icons-1.11.3/circle-fill.svg"
            style="margin-right: -50px"
          />
          <input
            type="text"
            value="يتم التخزين"
            class="m-5 production_field_display"
            readonly
          />
          <label style="font-weight: bold; font-size: 43px; margin-left: -50px"
            >ـــــــــــــــ</label
          ><img
            src="images/bootstrap-icons-1.11.3/circle-fill.svg"
            style="margin-right: -50px"
          />
          <input
            type="text"
            value="يتم التصدير "
            class="m-5 production_field_display"
            readonly
          />
        </div>
      </section>
      <!-- Start Production Steps -->
      @include('Clint.Incloude.Footer')
      @endsection