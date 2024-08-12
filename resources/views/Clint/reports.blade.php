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
<!-- Start Button Report Part -->
<section class="m-2 text-center">
    <h3 class="btn btn-success btn-sm">
      إجمالي المنتجات التي تم شرائها
      <br /><label class="fw-bold">232.87</label>
    </h3>
    <h3 class="btn btn-success btn-sm">
      المتبقي في المخازن
      <br /><label class="fw-bold">232</label>
    </h3>
    <h3 class="btn btn-success btn-sm">
      نشاط الموقع
      <br /><label class="fw-bold">100%</label>
    </h3>
  </section>
  <hr />
  <!-- End Button Report Part -->

  <!-- Start Report Table -->
  <section style="margin-right: 20%">
    <div dir="rtl" class="table_report">
      <table>
        <thead>
          <th>رقم المنتج</th>
          <th>الحفر</th>
          <th>البذور</th>
          <th>الاعتناء</th>
          <th>الحصاد</th>
          <th>التغليف</th>
          <th>التخزين</th>
          <th>التصدير</th>
          <th>المكدس</th>
        </thead>
      </table>
      <table>
        <thead>
          <th>#000000</th>
          <td>
            <div class="report">
              <label class="circle circle_green"></label>
              <label class="circle circle_green"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
            </div>
          </td>
        </thead>
        <thead>
          <th>#000000</th>
          <td>
            <div class="report">
              <label class="circle circle_green"></label>
              <label class="circle circle_green"></label>
              <label class="circle circle_green"></label>
              <label class="circle circle_green"></label>
              <label class="circle circle_green"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
            </div>
          </td>
        </thead>
        <thead>
          <th>#000000</th>
          <td>
            <div class="report">
              <label class="circle circle_green"></label>
              <label class="circle circle_green"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
              <label class="circle"></label>
            </div>
          </td>
        </thead>
      </table>
    </div>
  </section>
  <hr />
  <!-- End Report Table -->

  <!-- Start Pie Chart -->
  <section>
    <div class="pie-wrap">
      <div class="pie-info">
        <h3
          style="
            font-weight: bold;
            text-align: center;
            color: darkslategray;
            background-color: wheat;
            margin-top: 190px;
          "
        >
          إجمالي المنتجات التي تم شرائها
        </h3>
        <ul>
          <li class="coconut">جوزالهند: 25%</li>
          <li class="banana">الموز: 25%</li>
          <li class="orange">البرتقال: 25%</li>
          <li class="strawberry">الفراولة: 25%</li>
        </ul>
      </div>
    </div>
  </section>
  <!-- End Pie Chart -->
@include('Clint.Incloude.Footer')
@endsection