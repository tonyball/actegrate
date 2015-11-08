'use strict'

angular
  .module('actegrateApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ngTouch',
    'ngAnimate',
    'ngImgCrop'
  ])
  .config ($routeProvider,$locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/profile/:username',
        templateUrl: 'views/profile.html'
        controller: 'ProfileCtrl'
      .otherwise
        redirectTo: '/'
    $locationProvider.html5Mode(false)
