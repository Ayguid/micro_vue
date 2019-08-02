

@php
$lang=App::getLocale();
if ($lang== 'pt-BR') {
  $lang='pt';
}
$admin=Auth::guard('admin')->check();
@endphp


<div class="row">

  @foreach ($products as $product)
    @php
    $files =$product->getFiles();
    @endphp

    <div class="col-4 mt-2">

      <h5>Titulo : {{$product-> {'title_' . $lang} ?? $product->title_es}}  </h5>
      <h6>Codigo : {{$product->product_code}}</h6>
      @if ($admin)
        <a href="{{route('editProduct', $product->id)}}">edit</a>
      @endif


      @if ($product->has_image)
        @foreach ($files['images'] as $image)
          <img class="productPic" width="100%" src="{{asset('storage/product_images/'.$image->file_path)}}" alt="">
        @endforeach
      @else
        <img class="productPic" width="100%" src="{{asset('images/default.jpeg')}}" alt="">
      @endif





      <div class="row">
        <div class="col-12">
          <h6>{{$product-> {'desc_' . $lang} ?? $product->desc_es}}</h6>
        </div>
      </div>


      <div class="row">
        <div class="col-6">
          @foreach ($product->attributes as $att)
            @if ($att->attribute->filterable)
              <strong>{{$att->attribute-> {'name_' . $lang} ?? $att->attribute->name_es}}</strong><br>
              {{$att->value}} <br>
            @endif
          @endforeach
        </div>
        <div class="col-6">
          @foreach ($product->attributes as $att)
            @if (!$att->attribute->filterable)
              <strong>{{$att->attribute-> {'name_' . $lang} ?? $att->attribute->name_es}}</strong><br>
              {{$att->value}} <br>
            @endif
          @endforeach
        </div>
      </div>





    </div>

  @endforeach
</div>
{{$products->links() }}
