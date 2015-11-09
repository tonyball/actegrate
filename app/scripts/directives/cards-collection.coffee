'use strict'

angular.module('actegrateApp')
  .directive('cardsCollection', ->
    templateUrl: '../views/partials/cards-collection.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the cardsCollection directive'
  )
