@app = angular.module "uzfields", ["rails", 'ngClientSidePagination', 'ngClientSideSort', 'ngCrudControllerInjector', 'ui.bootstrap', 'ngMask', 'angularFileUpload']

@app.config ($interpolateProvider) ->
  $interpolateProvider.startSymbol("-[").endSymbol("]-")

@app.config [ "railsSerializerProvider",
  (railsSerializerProvider) -> railsSerializerProvider.underscore(angular.identity).camelize(angular.identity)
]
