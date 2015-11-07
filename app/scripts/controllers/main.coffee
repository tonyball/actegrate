'use strict'

angular.module('actegrateApp')
  .controller 'MainCtrl', ($scope, $rootScope, $location, $cookies, $http) ->
    $rootScope.title = 'Welcome'
    $scope.showNav = false
    if $cookies.get('current_user') != undefined
        $scope.showNav = true
        $location.path 'profile'
    else
        $location.path '/'
    $scope.next = (hide) ->
        $rootScope.title = "Login"
        angular.element('.mainBtn').hide()
        if hide == true
            $rootScope.title = "Register"
            angular.element('.logo').hide()
        return false
    $scope.back = ->
        $rootScope.title = "Welcome"
        angular.element('.mainBtn,.logo').removeClass('fadeOutLeft').removeClass('fadeOutRight').show()
        return false