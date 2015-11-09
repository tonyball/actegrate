'use strict'

angular.module('actegrateApp')
  .directive('friendsLeaderboard', ->
    templateUrl: '../views/partials/friends-leaderboard.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the friendsLeaderboard directive'
  )
