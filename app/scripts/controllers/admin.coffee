'use strict'

angular.module('actegrateApp')
  .controller 'AdminCtrl', ($scope,$rootScope,$http,$route) ->
    $rootScope.title = 'Admin Page'
    $scope.newUser = {}
    $scope.searchQuery = ''
    $http.get('http://localhost/users').success (data) ->
    	$scope.users = data

   	$scope.deleteUser = (user) ->
   		if !user.role
   			if confirm('Are you sure to delete '+user.username)
   				$http.delete('http://localhost/users/'+user.username).success (data) ->
   					Materialize.toast('<span class=red-text>'+data.username+' has been deleted</span>', 2000)
   					$route.reload()
   			else if user.role
   				alert 'Cannot delete Administrator User'
   		return false
   	$scope.editUser = (user) ->
   		$scope.showing = 'users-crud-form'
   		$scope.action = 'Edit'
   		user.birthdate = new Date(user.birthdate)
   		$scope.user = user
   		return false
   	$scope.viewUser = (user) ->
   		$scope.showing = 'users-crud-form'
   		$scope.action = 'View'
   		user.birthdate = new Date(user.birthdate)
   		$scope.user = user
   		return false
   	$scope.checkDupUsername = ->
   		console.log $scope.newUser
   		for usr in $scope.users
   			if usr.username == $scope.newUser.username
   				alert 'Username is already used'
   				$scope.newUser = ''
   				break
   		return false
   	$scope.checkDupEmail = ->
   		for usr in $scope.users
   			if usr.email.address == $scope.newUser.email.address
   				alert 'E-Mail is already used'
   				$scope.newUser.email.address = ''
   				break
   		return false
   	$scope.saveUser = ->
   		if $scope.action == 'Edit'
   			$scope.user.birthdate = new Date($scope.user.birthdate)
   			$http.put('http://localhost/users/'+$scope.user.username, $scope.user).success (data) ->
   				Materialize.toast('<span class=green-text>'+data.username+' has been updated</span>', 2000)
   				$route.reload()
   		else if $scope.action == 'Create'
   			$scope.newUser.birthdate = new Date($scope.newUser.birthdate)
   			$http.post('http://localhost/users/register',$scope.newUser).success (data) ->
   				Materialize.toast('<span class=green-text>'+data.username+' has been created</span>', 2000)
   				$route.reload()
   		return false

