ngCrudControllerInjectorModule = angular.module("ngCrudControllerInjector", [])
ngCrudControllerInjectorModule.factory "ngCrudControllerInjector", [ "ngClientSidePagination", "ngClientSideSort", (ngClientSidePagination, ngClientSideSort) ->
  base = {
    apply: (scope, resource, overrides) ->      
      scope.modelName = "Model"
      scope.modelNamePlural = "Models"
      scope.collection = []
      scope.pageSize = if overrides.pageSize? then overrides.pageSize else 10 
      scope.pagination = ngClientSidePagination.getNew(scope.pageSize)
      scope.sort = ngClientSideSort.getNew();
      scope.search = {}
      scope.form = {}
      scope.model = {}
      scope.errors = {}

      scope.query = () -> 
        scope.collection = resource.query()        

      scope.view = (model) ->        
        scope.model = resource.get { id: model.id }, () -> $('#view-modal').modal()
        true

      scope.new = () ->
        scope.form = {}
        scope.model = new resource()
        $('#form-modal').modal()
        true 
      
      scope.edit = (model) ->
        scope.form = {}
        scope.model = resource.get { id: model.id }, () -> $('#form-modal').modal()
        true
      
      scope.save = (model) ->        
        succces = (result) -> 
          scope.query()
          $('#form-modal').modal('hide')
        error = (result) ->
          angular.forEach result.data, (errors, field) ->
            scope.form[field].$setValidity('server', false)
            scope.errors[field] = errors.join(', ')
          bootbox.alert $('hidden#cant-save').val()
          $('#form-modal').scrollTop(0)
          
        if model.id then model.$update(succces, error) else model.$save(succces, error)

      scope.delete = (model) ->
        bootbox.confirm $('hidden#delete-question').val(), (r) ->           
          model.$delete(() -> scope.query()) if r         
        true
      
      scope.description = (model) ->
        scope.modelName

      angular.extend(scope, overrides)
      scope.query()     
      scope
  }
]
