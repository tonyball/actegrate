'use strict'

angular.module('actegrateApp')
  .directive('imageUpload', ($http, $route,$cookies)->
    templateUrl: '../views/partials/image-upload.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
    	scope.image = ''
    	scope.croppedImage = ''

    	scope.handleFileSelect = (evt) ->
    		scope.file = evt.currentTarget.files[0]
    		reader = new FileReader()
    		reader.onload = (evt) ->
    			scope.$apply((scope) ->
    				scope.image = evt.target.result
    			)
    		reader.readAsDataURL(scope.file)

    	angular.element(document.querySelector('#imageUploader')).on('change', scope.handleFileSelect)
    	scope.upload = ->
    		imageFile = scope.croppedImage
    		if scope.file.type.split('/')[1] == 'jpeg'
    			scope.file.type.split('/')[1] = 'jpg'
    		scope.user_info.avatar = scope.user_info.username+'.'+scope.file.type.split('/')[1]
    		$http.put('http://localhost/users/'+$cookies.get('current_user'),scope.user_info).success (data) ->
    			data.birthdate = new Date(data.birthdate)
    			scope.user_info = data
    			$http.post('http://localhost/users/avatar', {file:imageFile, name:scope.user_info.avatar}).success ->
    				Materialize.toast('<span class=green-text>Your Avatar is Updated</span>', 2000)
                    $route.reload()
    		return false
  )
