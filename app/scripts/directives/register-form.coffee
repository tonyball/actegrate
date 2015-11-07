'use strict'

angular.module('actegrateApp')
  .directive('registerForm', ($http, $cookies) ->
    templateUrl: '../views/partials/register-form.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
    	$http.get('http://localhost/users').success (data) ->
    		scope.user_data = data
    	scope.register = ->
    		$http.post('http://localhost/users/register', scope.user).success (data) ->
    			$cookies.put('current_user', data.username)
    			window.location.reload()
    		return false
    	scope.checkDupEmail = ->
    		for u in scope.user_data
    			if u.email.address == scope.user.email.address
    				angular.element('#email').removeClass('validate valid').addClass('invalid')
    				angular.element('#email').next('label').attr('data-error','E-Mail is Duplicate!')
    				return false
    		angular.element('#email').addClass('validate')
    		angular.element('#email').next('label').attr('data-error','E-Mail is invalid!')
    		return false
    	scope.checkDupUsername = ->
    		for u in scope.user_data
    			if u.username == scope.user.username
    				angular.element('#username').removeClass('validate valid').addClass('invalid')
    				angular.element('#username').next('label').attr('data-error','Username is Duplicate!')
    				return false
    		angular.element('#username').addClass('validate')
    		angular.element('#username').next('label').attr('data-error','username must contain only letters or numbers at least 4 characters.')
    		return false
    	scope.isMatch = ->
    		if scope.user.password != scope.confirm
    			angular.element('#confirm').addClass('invalid').removeClass('valid')
    		else
    			angular.element('#confirm').removeClass('invalid').addClass('valid')
    		return false
  )
