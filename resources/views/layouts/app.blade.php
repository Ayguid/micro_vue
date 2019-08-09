<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta name="base-url" content="{{ url('') }}" />

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  {{-- <meta http-equiv="X-UA-Compatible" content="IE=9">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> --}}
<meta property="og:description" content="Neumática / Electrónica / Automatización industrial">
<meta name="description" content="Neumática / Electrónica / Automatización industrial">
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>{{ config('app.name') }}</title>

  <!-- Scripts -->
  <script src="{{ asset('js/app.js') }}" defer></script>


  <!-- Fonts -->
  <link rel="dns-prefetch" href="//fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
  <script src="https://kit.fontawesome.com/6a953b9625.js"></script>
  <!-- Styles -->
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
  <link href="{{ asset('css/micro.css') }}" rel="stylesheet">
</head>
<body>
  <div id="app">

    <nav class="navbar navbar-expand-md navbar-light navbar-laravel">
      <div class="container">
        <a class="navbar-brand" href="{{ route('landing')}}">
          {{ config('app.name', 'Laravel') }}
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Left Side Of Navbar -->
          <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {{ config('app.locale')}}
                {{-- {{LaravelLocalization::getCurrentLocale()}} --}}
                {{-- {{Lang::get('messages.language')}} --}}
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                    <a class="dropdown-item" rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                      {{ $properties['native'] }}
                    </a>&nbsp;
                @endforeach
              </div>
            </li>



              <li class="nav-item dropdown">
                @if (session('country'))

                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{session('country')->country_desc}}
                  </a>
                @endif
                <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                  <a class="dropdown-item" href="{{route('country_landing')}}">{{ Lang::get('messages.change_country')}}</a>

                </div>
              </li>

          </ul>

          <!-- Right Side Of Navbar -->

          <search-component class="d-none d-md-block" :consulturl='{{json_encode(route('userFindProduct'))}}'></search-component>  {{--visible en vista con nav completo--}}

          <ul class="navbar-nav ml-auto">
            <!-- Authentication Links -->
            @guest
              <li class="nav-item">
                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
              </li>
              @if (Route::has('register'))
                <li class="nav-item">
                  <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                </li>
              @endif
            @else

              <li class="nav-item dropdown">
                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                  {{ Auth::user()->name }} <span class="caret"></span>
                </a>

                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">

                  <a href="{{route('home')}}" class="dropdown-item">Home</a>
                  <a class="dropdown-item" href="{{ route('logout') }}"
                  onclick="event.preventDefault();
                  document.getElementById('logout-form').submit();">
                  {{ __('Logout') }}
                </a>

                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                  @csrf
                </form>
              </div>
            </li>
          @endguest

        </ul>
        <search-component class="d-md-none" :consulturl='{{json_encode(route('userFindProduct'))}}'></search-component>  {{--visible en menu desplegable--}}
      </div>
    </div>
  </nav>

  <main class="">
    @yield('content')
  </main>
</div>
</body>
</html>
