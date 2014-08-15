@app.factory "OneField", [ "railsResourceFactory", "railsSerializer", 
  (railsResourceFactory, railsSerializer) -> railsResourceFactory({
    url: "/json/one_fields", 
    name: "one_field",
    serializer: railsSerializer(() -> this.exclude('created_at', 'updated_at', 'id'))
  })
]

sortModule.factory "ngClientSideSort", ($filter) ->
  sort = {}
  sort.getNew = (field, direction) ->   
    sort.field = field
    sort.direction = (if direction? then direction else true)

    sort.by = (field) ->
      sort.direction = !sort.direction if field == sort.field
      sort.field = field

    sort.byIcon = (field) ->
      if sort.field == field        
        if sort.direction then 'fa-sort-desc' else 'fa-sort-up'
      else
        "fa-sort"
        
    sort
  sort

@app.controller "OneFieldsCtrl", ($scope, $modal, OneField, ngClientSidePagination, ngClientSideSort) -> 
  $scope.modelName = "OneField"
  $scope.modelNamePlural = "OneFields"
  $scope.collection = []
  $scope.modalForm = $scope.modalView = null
  $scope.pagination = ngClientSidePagination.getNew(10)
  $scope.sort = ngClientSideSort.getNew();
  $scope.search = {}

  $scope.query = () -> 
    OneField.query().then((data) -> $scope.collection = data)

  $scope.view = (model) ->
    $scope.cancel()
    $scope.viewModalTitle = "View #{$scope.modelName}"
    OneField.get(model.id).then((data) -> $scope.modalView = model = data)
    $('#viewModal').modal()
    true

  $scope.edit = (model) ->
    $scope.cancel()
    $scope.formModalTitle = "Edit #{$scope.modelName}"
    OneField.get(model.id).then((data) -> $scope.modalForm = model = data)
    $('#formModal').modal()
    true

  $scope.delete = (model) ->
    bootbox.confirm("Are you sure to delete the #{$scope.modelName}?", (r) -> 
        model.delete().then(() -> $scope.query()) if r)
    true

  $scope.new = () ->
    $scope.formModalTitle = "New #{$scope.modelName}"
    $scope.modalForm = new OneField()
    $('#formModal').modal()    
    true

  $scope.save = (model) ->
    if model.id 
      model.update().then(() -> $scope.query())
    else
      model.create().then(() -> $scope.query())    

  $scope.cancel = () ->
    $scope.modalForm = null
    $scope.modalView = null

  $scope.query()
