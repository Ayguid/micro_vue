<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
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
                {{Lang::get('messages.language')}}
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                    <a class="dropdown-item" rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                      {{ $properties['native'] }}
                    </a>&nbsp;
                @endforeach
              </div>
            </li>


            <li class="nav-item"> <a class="nav-link" href="{{route('country_landing')}}">{{ Lang::get('messages.change_country')}}</a> </li>
          </ul>

          <!-- Right Side Of Navbar -->
          {{-- <form id="searchForm" action="{{route('userFindProduct')}}" method="get" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="{{Lang::get('messages.search')}}" aria-label="{{Lang::get('messages.search')}}" name="query">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">{{Lang::get('messages.search')}}</button>
          </form> --}}
          <search-component></search-component>

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
      </div>
    </div>
  </nav>

  <main class="">
    @yield('content')
  </main>
</div>
</body>
</html>
