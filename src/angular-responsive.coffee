responsive = angular.module "angular-responsive", []

responsive.service "Breakpoint", ->
  w: 0
  h: 0

responsive.directive "responsive", ($window, Breakpoint)->
  restrict: "A"
  link: (scope, element, attrs)->
    
    w = angular.element($window)
        
    Breakpoint.w = w.width()
    Breakpoint.h = w.height()
    
    w.bind "resize", ->
     
      Breakpoint.w = w.width()
      Breakpoint.h = w.height()
      
      scope.$digest()

responsive.directive "minWidth", (Breakpoint)->
  restrict: "A"
  link: (scope, element, attrs)->
    scope.$watch ->
      Breakpoint.w
    , (newWidth)->
      element.hide() if newWidth < parseInt attrs.minWidth
      element.show() if newWidth > parseInt attrs.minWidth

responsive.directive "maxWidth", (Breakpoint)->
  restrict: "A"
  link: (scope, element, attrs)->
    scope.$watch ->
      Breakpoint.w
    , (newWidth)->
      element.hide() if newWidth > parseInt attrs.maxWidth
      element.show() if newWidth < parseInt attrs.maxWidth  

responsive.directive "responsiveBooleans", (Breakpoint, $parse)->
  restrict: "A"
  link: (scope, element, attrs)->
    
    conditions = $parse(attrs.responsiveBooleans)(scope)
    
    parseConditions = ->
      angular.forEach conditions, (val, key, obj)->
        conditions[key] =
          operation: (val[0])
          value: ( val.substring 1 )
        
    checkConditions = (value)->   
      angular.forEach conditions, (val, key)->
        switch val.operation
          when '>' then scope[key] = value > val.value
          when '<' then scope[key] = value < val.value
          when '=' then scope[key] = value == val.value
        
    parseConditions()
    
    scope.$watch ->
      Breakpoint.w
    , (newWidth)->
      checkConditions newWidth

responsive.directive "responsiveClasses", (Breakpoint, $parse)->
  restrict: "A"
  link: (scope, element, attrs)->
    
    conditions = $parse(attrs.responsiveClasses)(scope)
    
    parseConditions = ->
      angular.forEach conditions, (val, key, obj)->
        conditions[key] =
          operation: (val[0])
          value: ( val.substring 1 )
        
    checkConditions = (value)->   
      angular.forEach conditions, (val, key)->
        switch val.operation
          when '>' 
            if value > val.value
              element.addClass key 
            else element.removeClass key

          when '<'
            if value < val.value
              element.addClass key 
            else element.removeClass key
            
          when '='
            if value == val.value
              element.addClass key 
            else element.removeClass key
        
    parseConditions()
    
    scope.$watch ->
      Breakpoint.w
    , (newWidth)->
      checkConditions newWidth    