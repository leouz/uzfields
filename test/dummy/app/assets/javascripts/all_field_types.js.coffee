# @app = angular.module "adminDev", ["ngCookies", "ngBootbox"]

# @app.config ($interpolateProvider) ->
#   $interpolateProvider.startSymbol("-[").endSymbol("]-")

# @app.controller "PagesCtrl", ($scope) -> 
#   $scope.folders = [
#     {
#       name: "main",
#       pages: [ "layout" ],
#       partials: [ "head", "top-menu", "footer" ]
#     },
#     {
#       name: "home",
#       pages: [ "index", "connect", "private-events", "event", "table-service", "choose-gallery", "gallery", "gallery-open", "calendar", "the-club" ],
#       partials: [ "calendar-widget", "slider-widget", "social-links" ]
#     },
#     {
#       name: "shared",
#       pages: [],
#       partials: []      
#     }
#   ]

#   $scope.threeViewFolderState = ["main"]
  
#   $scope.setThreeViewFolderState = (folder) ->
#     index = $scope.threeViewFolderState.indexOf(folder)
#     if (index == -1)
#       $scope.threeViewFolderState.push(folder)
#     else
#       $scope.threeViewFolderState.splice(index, 1)
  


