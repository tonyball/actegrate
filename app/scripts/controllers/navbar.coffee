'use strict'

angular.module('actegrateApp')
  .controller 'NavbarCtrl', ($scope,$location) ->
    $scope.isActive = (viewLocation) ->
   		location = $location.path().split '/'
   		viewLocation == "/"+location[1]
