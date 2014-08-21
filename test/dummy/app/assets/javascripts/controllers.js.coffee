@app.factory "OneField", [ "railsResourceFactory", "railsSerializer", 
  (railsResourceFactory, railsSerializer) -> railsResourceFactory({
    url: "/json/one_fields"
    name: "one_field"
    serializer: railsSerializer(() -> this.exclude('created_at', 'updated_at', 'id'))
  })
]

@app.factory "OneImageField", [ "railsResourceFactory", "railsSerializer", "saveIndicatorInterceptor"
  (railsResourceFactory, railsSerializer, saveIndicatorInterceptor) -> railsResourceFactory({
    url: "/json/one_image_fields", 
    name: "one_image_field",
    serializer: railsSerializer(() -> this.exclude('created_at', 'updated_at', 'id'))
  })
]

@app.controller "OneFieldsCtrl", ($scope, OneField, ngCrudControllerInjector) ->
  $scope = ngCrudControllerInjector.apply($scope, OneField, {
    modelName: "OneField"
    modelNamePlural: "OneFields"            
  })

@app.controller "OneImageFieldsCtrl", ($scope, OneField, ngCrudControllerInjector) ->
  $scope = ngCrudControllerInjector.apply($scope, OneField, {
    modelName: "OneImageField"
    modelNamePlural: "OneImageFields"            
  })


