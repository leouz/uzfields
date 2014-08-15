@app.factory "saveIndicatorInterceptor", ->
  beforeRequest: (httpConfig, resourceConstructor, context) ->
    context.savePending = true  if context and (httpConfig.method is "post" or httpConfig.method is "put")
    httpConfig


@app.factory "OneImageField", [ "railsResourceFactory", "railsSerializer", "saveIndicatorInterceptor"
  (railsResourceFactory, railsSerializer, saveIndicatorInterceptor) -> railsResourceFactory({
    url: "/json/one_image_fields", 
    name: "one_image_field",
    serializer: railsSerializer(() -> this.exclude('created_at', 'updated_at', 'id'))
    interceptors: [saveIndicatorInterceptor]
  })
]

@app.controller "OneImageFieldsCtrl", ($scope, $modal, OneImageField, ngClientSidePagination, ngClientSideSort, $upload) -> 
  $scope.modelName = "OneImageField"
  $scope.modelNamePlural = "OneImageFields"
  $scope.collection = []
  $scope.modalForm = $scope.modalView = null
  $scope.pagination = ngClientSidePagination.getNew(10)
  $scope.sort = ngClientSideSort.getNew();

  $scope.query = () -> 
    OneImageField.query().then((data) -> $scope.collection = data)

  $scope.view = (model) ->
    $scope.cancel()
    $scope.viewModalTitle = "View #{$scope.modelName}"
    OneImageField.get(model.id).then((data) -> $scope.modalView = model = data)
    $('#viewModal').modal()
    true

  $scope.edit = (model) ->
    $scope.cancel()
    $scope.formModalTitle = "Edit #{$scope.modelName}"
    OneImageField.get(model.id).then((data) -> $scope.modalForm = model = data)
    $('#formModal').modal()
    true

  $scope.delete = (model) ->
    bootbox.confirm("Are you sure to delete the #{$scope.modelName}?", (r) -> 
        model.delete().then(() -> $scope.query()) if r)
    true

  $scope.new = () ->
    $scope.formModalTitle = "New #{$scope.modelName}"
    $scope.modalForm = new OneImageField()
    $('#formModal').modal()    
    true

  $scope.save = (model) ->
    # formData = new FormData()
    $input = $('#one_image_field_image_field')
    model["image_field"] = $input[0].files[0]
    # formData.append('one_image_field[image_field]', $input[0].files[0])
    # $.ajax({
    #   url: "/json/one_image_fields",
    #   data: formData,
    #   cache: false,
    #   contentType: false,
    #   processData: false,
    #   type: 'POST'
    # })
    if model.id 
      model.update().then(() -> $scope.query())
    else
      model.create().then(() -> $scope.query())    

  $scope.cancel = () ->
    $scope.modalForm = null
    $scope.modalView = null

  $scope.query()
