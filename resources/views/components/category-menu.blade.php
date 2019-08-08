<div class="row">
  @foreach ($data['categories'] as $cat)
    <div class="col-12 col-md-4 col-lg-3">
      <div class="row">
        <div class="btn-group col-12 mb-1">
          <button type="button" class="btn btn-primary dropdown-toggle w-100" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            {{$cat-> {'title_' . $lang} ?? $cat->title_es}}</button>

            <div class="dropdown-menu">
              @foreach ($cat->getSubCategories as $sub)
                <a class="dropdown-item bg-light" href="{{route('productsCat', $sub->id)}}">{{$sub-> {'title_' . $lang} ?? $sub->title_es}}</a>
              @endforeach
            </div>
          </div>
          @if (!isset($data['category']) && !isset($data['products']))
            <div class="col-12">
              <img src="{{asset('images/covers/'.$cat->image_path)}}" alt="" width="100%">
            </div>
          @endif
        </div>
      </div>
    @endforeach
  </div>
