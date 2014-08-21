ngCrudControllerInjectorModule = angular.module("ngCrudControllerInjector", [])
ngCrudControllerInjectorModule.factory "ngCrudControllerInjector", [ "ngClientSidePagination", "ngClientSideSort", (ngClientSidePagination, ngClientSideSort) ->
  base = {
    apply: (scope, resource, overrides) ->
      scope.model = 'model'
      scope.modelName = "Model"
      scope.modelNamePlural = "Models"
      scope.modalTitles = {
        view: () -> "View #{scope.modelName}"
        new: () -> "New #{scope.modelName}"
        edit: () -> "Edit #{scope.modelName}"
      }
      scope.newButtonTitle = "New #{scope.modelName}"       
      scope.deleteQuestion = "Are you sure to delete the #{scope.modelName}?"
      
      scope.collection = []
      scope.modalForm = scope.modalView = null
      scope.pagination = ngClientSidePagination.getNew(10)
      scope.sort = ngClientSideSort.getNew();
      scope.search = {}      

      scope.query = () -> 
        scope.collection = resource.query()        

      scope.view = (model) ->
        scope.formModalTitle = scope.modalTitles.view()
        scope.resetModal()                
        scope.modalView = model = resource.get { id: model.id }, () -> $('#viewModal').modal()
        true

      scope.edit = (model) ->
        scope.formModalTitle = scope.modalTitles.edit()
        scope.resetModal()
        scope.modalForm = model = resource.get { id: model.id }, () -> $('#formModal').modal()
        true

      scope.delete = (model) ->
        bootbox.confirm scope.deleteQuestion, (r) ->           
          model.$delete(() -> scope.query()) if r         
        true

      scope.new = () ->
        scope.formModalTitle = scope.modalTitles.new()
        scope.modalForm = new resource()
        $('#formModal').modal()    
        true

      scope.save = (model) ->        
        if model.id 
          model.$update(() -> scope.query())
        else
          model.$save(() -> scope.query())              

      scope.resetModal = () ->
        scope.modalForm = null
        scope.modalView = null

      angular.extend(scope, overrides)
      scope.query()     
      scope
  }
]
