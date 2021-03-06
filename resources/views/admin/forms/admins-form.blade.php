@php
$admin=new App\Admin();
@endphp

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">{{ __('Agregar') }}</div>

                    <div class="card-body">
                        <form method="POST" action="{{ route('addAdmin') }}">
                            @csrf

                            <div class="form-group row">
                                <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>

                                <div class="col-md-6">
                                    <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                    @if ($errors->has('name'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('name') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                                <div class="col-md-6">
                                    <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autocomplete="email">

                                    @if ($errors->has('email'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('email') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required autocomplete="new-password">

                                    @if ($errors->has('password'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('password') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>

                                <div class="col-md-6">
                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="job_title" class="col-md-4 col-form-label text-md-right">{{ __('Job Title') }}</label>


                                <div class="col-md-6">
                                  <select class="col-12" name="job_title">
                                    <option value="">--</option>
                                  @foreach ($admin->possibleJobTitles() as $jT)
                                    <option value="{{$jT['name']}}">{{$jT['name']}}</option>
                                  @endforeach
                                </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="job_title" class="col-md-4 col-form-label text-md-right">{{ __('Country') }}</label>


                                <div class="col-md-6">
                                  <select class="col-12" name="country_id">
                                    <option value="">--</option>
                                  @foreach (App\Models440\Country::all() as $cty)
                                    <option value="{{$cty['id']}}">{{$cty['country_desc']}}</option>
                                  @endforeach
                                </select>
                                </div>
                            </div>



                            <div class="form-group row">
                                <label for="contactable" class="col-md-4 col-form-label text-md-right">{{ __('Contactable') }}</label>
                                <input type="checkbox" name="contactable" value="1">


                            </div>



                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        {{'Agregar'}}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
