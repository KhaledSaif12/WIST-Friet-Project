@extends('Clint.layout.master')
@section('content')

   <!-- Start Contact Us -->
   <div class="contt">
    <div class="container" style="display: flex">
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
            <textarea name="" id="" placeholder="نص الرسالة" class="bg-light pt-4"></textarea>
          </div>
          <div>
            <input
              type="submit"
              value="إرسال"
              name=""
              class="btn btn-success rounded-pill text-light contact_button"
            />
          </div>
          <div class="contact_icon">
            <a href="">
              <img src="{{asset('client/images/bootstrap-icons-1.11.3/twitter-x.svg')}}" alt="" />
            </a>
            <a href="">
              <img src="{{asset('client/images/bootstrap-icons-1.11.3/instagram.svg')}}" alt="" />
            </a>
            <a href="">
              <img src="{{asset('client/images/bootstrap-icons-1.11.3/facebook.svg')}}" alt="" />
            </a>
          </div>

          <label for="" class="copyright">bigcart@green.com</label>
        </form>
      </div>
      <div>
        <img
          src="{{asset('client/images/contact.png')}}"
          class="additional_photo contact_additional"
        />
      </div>
    </div>
  </div>
  <div>
    <label class="bg-light m-5"></label>
  </div>
  <!-- End Contact Us -->


@endsection