'use strict'

angular.module('actegrateApp')
  .controller 'AdminCtrl', ($scope,$rootScope,$http) ->
    $rootScope.title = 'Admin Page'
    $http.get('http://localhost/users').success (data) ->
    	$scope.users = data
