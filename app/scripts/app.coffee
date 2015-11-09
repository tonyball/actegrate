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
      .when '/admin',
        templateUrl: 'views/admin.html'
        controller: 'AdminCtrl'
      .otherwise
        redirectTo: '/'
    $locationProvider.html5Mode(false)
