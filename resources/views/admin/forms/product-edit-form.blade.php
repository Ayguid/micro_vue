{{-- @php
$product = $data['product'];
$productFiles = $product->files;
$productData = json_encode(
['product'=>$product,
'productFiles'=>$productFiles]
);
@endphp --}}
{{-- <drop-zone :data="{{$productData}}"></drop-zone> --}}



<form id="editProductForm" class="" action="{{route('updateProduct')}}" method="post">
  {{ csrf_field() }}

  <hr>

  <div class="row">
    <div class="col-12 m-0 p-0">
      <div class="bg-info text-white p-2">
        <h4>El producto se encuentra en</h4>
        @foreach ($data['product']->possibleCountries() as $country)
          <div class="">
            <input type="checkbox" name="country_id[]" value="{{$country->id}}" {{$data['product']->isInCountry($country->id)? ' checked' : '' }}>
            <label for="{{$country->country_desc}}">{{$country->country_desc}}</label>
          </div>
        @endforeach
      </div>
    </div>
  </div>

  <hr>

  <div class="row bg-primary text-white">
    <div class="col-12">
    <h5>Informacion principal del producto</h5>
      <div class="row">


        @foreach ($data['product']->getFillable() as $fKey => $fValue)

          @foreach ($data['product']->getAttributes() as $aKey => $aValue)

            @if ($aKey == $fValue && $aKey !=='category_id' && $fValue !=='has_image'&& $fValue !=='has_pdf'&& $fValue !=='has_cad_2d'&& $fValue !=='has_cad_3d'&& $fValue !=='has_zip')
              <div class="form-group col-md-4">
                @if ($fValue =='desc_es'|| $fValue =='desc_en' || $fValue =='desc_pt')
                  <label for="">{{$fValue}}</label>
                  <textarea class="form-control{{ $errors->has($fValue) ? ' is-invalid' : '' }}" name="{{$aKey}}">{{$aValue}}</textarea>
                @else
                  <label for="">{{$fValue}}</label>
                  <input class="form-control{{ $errors->has($fValue) ? ' is-invalid' : '' }}" type="text" name="{{$aKey}}" value="{{$aValue}}">
                @endif
                @if ($errors->has($fValue))
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first($fValue) }}</strong>
                  </span>
                @endif
              </div>
            @endif
          @endforeach
        @endforeach
      </div>
    </div>
  </div>

  <hr>

  <div class="row">
    <div class="bg-info text-white col-12">

      <h5>Attributos del producto</h5>

      <div class="col-10 offset-1">
        <div class="row">

          @foreach ($data['original_cat']->attributes()->get() as $attr)
            <div class="form-group col-6">

              @php
              $value = $data['product']->attributeValue($attr->id)?$data['product']->attributeValue($attr->id)->value:'';
              @endphp

              @if ($attr->type=="textarea")
                <label for="">{{$attr->name_es}}</label>
                <textarea rows="8" cols="80" name="attributes[{{$attr->id}}]" value="">{{$value}}</textarea>
              @endif
              @if ($attr->type=="float")
                <label for="">{{$attr->name_es}}</label>
                <input class="form-control{{ $errors->has($attr->name_es) ? ' is-invalid' : '' }}"
                type="number" step="0.1" name="attributes[{{$attr->id}}]"
                value="{{$value}}">
              @endif
              @if ($attr->type=="string")
                <label for="">{{$attr->name_es}}</label>
                <input class="form-control{{ $errors->has($attr->name_es) ? ' is-invalid' : '' }}" type="text"
                name="attributes[{{$attr->id}}]" value="{{$value}}">
              @endif
              @if ($attr->type=="password")
                <label for="">{{$attr->name_es}}</label>
                <input class="form-control{{ $errors->has($attr->name_es) ? ' is-invalid' : '' }}" type="password"
                name="attributes[{{$attr->id}}]" value="{{$value}}">
              @endif

            </div>
          @endforeach
        </div>
      </div>
    </div>
  </div>





  <hr>
  <input type="text" name="product_id" value="{{$data['product']->id}}" hidden>
  <button type="submit" name="button" class="btn btn-primary">Guardar cambios en producto</button>
</form>


<hr>
