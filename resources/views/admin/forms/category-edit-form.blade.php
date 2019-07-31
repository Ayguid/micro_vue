
<form class="" action="{{route('updateCat', $category->id)}}" method="post">
  {{ csrf_field() }}


  <div class="row">
    @foreach ($category->getFillable() as $fKey => $fValue)
      @foreach ($category->getAttributes() as $aKey => $aValue)


        @if ($aKey == $fValue && $aKey!=='parent_id')
          <div class="form-group col-md-4">
            <label for="">{{$fValue}}</label>
            <input class="form-control{{ $errors->has($fValue) ? ' is-invalid' : '' }}" type="text" name="{{$aKey}}" value="{{$aValue}}">
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

  <div class="form-group row mb-0">
    <div class="col-md-6 offset-md-4">
      <button type="submit" name="button" class="btn btn-primary">
        Guardar cambios en categoria
      </button>
    </div>
  </div>

</form>
