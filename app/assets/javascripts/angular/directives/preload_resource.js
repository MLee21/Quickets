(function () {
  angular.module("Quickets").
    directive("preloadResource", function() {
      return {
        link: function(scope, element, attrs) {
          scope[attrs.as] = JSON.parse(attrs.preloadResource);
          element.remove();
        }
      };
    });
})()