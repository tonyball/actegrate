'use strict'

angular.module('actegrateApp')
  .directive('navigation', ($cookies,$http)->
    templateUrl: '../views/partials/navigation.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
        angular.element(".dropdown-button").dropdown({alignment:'right',constrain_width:false})
        angular.element(".notification-button").dropdown({alignment:'right',constrain_width:false,hover:true})
        $http.get('http://localhost/users/'+$cookies.get('current_user')).success (data) ->
            scope.user_info = data
        scope.logout = ->
            scope.showNav = false
            $cookies.remove('current_user')
            window.location.reload()
            return false
  )
