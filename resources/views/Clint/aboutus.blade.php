@extends('Clint.layout.master')
@section('content')


    <!-- Start About Us  -->
    <div class="about_us">
        <div class="about_us_icon"></div>
        <div>
          <h2 class="aboutus_description">
            نحن في My Farm نتيح لك كل ما تحتاج شراءه من المزرعة عن طريق التطبيق
            وبنقرة زر
          </h2>
        </div>
        <div class="additional_photo">
          <img src="{{asset('client/images/additional_aboutus_picture.png')}}" alt="" />
        </div>
      </div>
  
      <div class="about_us" style="margin-top: -100px">
        <div class="about_us_icon"></div>
        <div>
          <h2 class="aboutus_description">
            من المزرعة إلى المائدة<br />
            يتضمن هذا المفهوم توصيل المنتجات الغذائية مباشرة من المزارع إلى
            المستهلكين. مما يقلل من عدد الوسطاء ويروج للمنتجات الطازجة والمحلية
          </h2>
        </div>
      </div>
  
      <div class="about_us">
        <div class="about_us_icon"></div>
        <div>
          <h2 class="aboutus_description">
            استمتع واقضي أجمل الأوقات بالشراء من المنزل
          </h2>
        </div>
      </div>
  
      <!-- End About Us  -->

@endsection