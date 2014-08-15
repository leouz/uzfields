sortModule = angular.module("ngClientSideSort", [])
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