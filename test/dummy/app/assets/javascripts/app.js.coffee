@app = angular.module "uzfields", ["rails", 'ngClientSidePagination', 'ngClientSideSort', 'ui.bootstrap', 'angularFileUpload']

@app.config ($interpolateProvider) ->
  $interpolateProvider.startSymbol("-[").endSymbol("]-")

@app.config [ "railsSerializerProvider",
  (railsSerializerProvider) -> railsSerializerProvider.underscore(angular.identity).camelize(angular.identity)
]
