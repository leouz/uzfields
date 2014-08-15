paginationModule = angular.module("ngClientSidePagination", [])
paginationModule.factory "ngClientSidePagination", ($filter) ->
  pagination = {}
  pagination.getNew = (perPage, data) ->
    pagination.perPage = (if perPage? then perPage else 10)
    data = (if data? then data else [])
    
    pagination.refreshData = (data) ->      
      pagination._page = 0 if pagination.collection? && pagination.collection.length != data.length
      pagination.collection = data
      pagination.numPages = Math.ceil(pagination.collection.length/pagination.perPage)

    pagination.refreshData(data)

    pagination.page = -> pagination._page + 1

    pagination.isCurrentPage = (pageNumber) ->
      pageNumber == pagination.page()

    pagination.isLastPage = () ->
      pagination.page() == pagination.numPages

    pagination.isFirstPage = () ->
      pagination.page() == 1

    pagination.prevPage = ->
      pagination._page -= 1  if pagination._page > 0      

    pagination.nextPage = ->
      pagination._page += 1  if pagination._page < pagination.numPages - 1      

    pagination.toPage = (number) ->
      number -= 1
      pagination._page = number if number >= 0 and number <= pagination.numPages - 1 

    pagination.pageData = ->
      startFrom = pagination._page * pagination.perPage
      if pagination.collection 
        $filter('limitTo')(pagination.collection.slice(+startFrom), pagination.perPage) 
      else 
        pagination.collection
    
    pagination.pages = ->      
      i = 1
      result = []
      while i <= pagination.numPages
        result.push i
        i++
      result
    

    pagination
  pagination

paginationModule.filter "paginate", ->
  (input, pagination) ->
    pagination.refreshData(input)
    pagination.pageData()
    
