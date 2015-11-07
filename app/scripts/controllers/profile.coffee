'use strict'

angular.module('actegrateApp')
  .controller 'ProfileCtrl', ($scope,$rootScope,$routeParams, $cookies, $http,$route) ->
  	$scope.current_user = $cookies.get('current_user')
  	$http.get('http://localhost/users/'+$routeParams.username).success (data) ->
  		data.birthdate = new Date(data.birthdate)
  		$scope.user_info = data
  		$scope.user_info.total_points = 0
  		for p in $scope.user_info.points
  			$scope.user_info.total_points += p
  		$rootScope.title = '@'+$scope.user_info.username

  	$scope.clicked = ($event) ->
  		current = $event.target
  		angular.element('.link-btn').removeClass('active')
  		angular.element(current).addClass('active')
  		return false
  	$scope.saveProfile = ->
  		$scope.user_info.birthdate = new Date($scope.user_info.birthdate)
  		$http.put('http://localhost/users/'+$scope.current_user, $scope.user_info).success (data) ->
  			data.birthdate = new Date(data.birthdate)
  			$scope.user_info = data
  			Materialize.toast('<span class=green-text>Your Profile is Updated</span>', 2000)
  			$route.reload()
  		return false

  	angular.element('textarea').characterCounter()
  	angular.element('.datepicker').pickadate({selectMonths:true,selectYears: 100})
  	angular.element('.tooltipped').tooltip({delay: 50})
