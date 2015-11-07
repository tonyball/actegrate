'use strict'

angular.module('actegrateApp')
  .directive('loginForm', ($http,$location,$cookies) ->
    templateUrl: '../views/partials/login-form.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
    	scope.login = ->
    		$http.post('http://localhost/users/login',{username:scope.username,password:scope.password}).success (data) ->
                if data == 'u'
                    scope.showFlash = true
                    scope.flash_text = 'Username not found.'
                else if data == 'p'
                    scope.showFlash = true
                    scope.flash_text = 'Password is incorrect.'
                else if data != false
                    $cookies.put('current_user', data.username)
                    window.location.reload()
                return false
    	scope.forgotPassword = ->
    		return false
  )
