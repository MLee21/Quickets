(function () {
  function ArtistsController ($scope) {
    $scope.moment = moment;
  }
  angular.module("Quickets")
    .controller("ArtistsController", ["$scope", ArtistsController])
})()