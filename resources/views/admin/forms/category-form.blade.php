@php
$cat= new App\Models440\Category();

@endphp

<form method="POST" action="{{route('addCategory')}}">
  @csrf

  <div class="row">
    @foreach ($cat->getFillable() as $fValue)
      @if ($fValue !=='parent_id')
        <div class="form-group col-md-4">
          <label for="">{{$fValue}}</label>
          <input class="form-control{{ $errors->has($fValue) ? ' is-invalid' : '' }}" type="text" name="{{$fValue}}" value="">
          @if ($errors->has($fValue))
            <span class="invalid-feedback" role="alert">
              <strong>{{ $errors->first($fValue) }}</strong>
            </span>
          @endif
        </div>
      @endif
    @endforeach
  </div>


  <div class="form-group row mb-0">
    <div class="col-md-6 offset-md-4">
      <button type="submit" class="btn btn-primary">
        Agregar categoria
      </button>
    </div>
  </div>
</form>
