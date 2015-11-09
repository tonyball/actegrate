'use strict'

angular.module('actegrateApp')
  .controller 'SettingsCtrl', ($scope, $rootScope, $http, $route,$cookies) ->
    $rootScope.title = 'Settings'
    $scope.checkOldPassword = ->
    	$http.post('http://localhost/users/login',{username:$cookies.get('current_user'),password: $scope.oldpassword}).success (data) ->
    		$scope.user = data
    		if data == 'p'
    			alert 'your current password is not correct.'
    		else if data != 'p'
    			$scope.isCorrect = true
    	return false

    $scope.savePassword = ->
    	$scope.user.password = $scope.newpassword
    	$http.post('http://localhost/users/changepassword', $scope.user).success (data) ->
    		$route.reload()
    		$scope.user = data

    $scope.confirmDeletion = ->
    	$http.post('http://localhost/users/login',{username:$cookies.get('current_user'),password: $scope.passwordtodelete}).success (data) ->
    		if data == 'p'
    			alert 'your password is not correct.'
    		else if data != 'p'
    			if confirm('Are you sure to delete your Actegrator Account?')
    				$http.delete('http://localhost/users/'+$cookies.get('current_user')).success ->
    					$cookies.remove('current_user')
    					window.location.reload()
    	return false 