angular.module('SurveyWrangler').controller('SurveyCarryForwardController', function ($scope, SurveyCarryForward, $routeParams, $location) {
    console.log($routeParams)
    var id = $routeParams.id;
    $scope.survey = SurveyCarryForward.get({ responseId: id })
    //$scope.isSubmitting = false;
    console.log($scope.survey)

    //$scope.setSelected = function (selected) {
    //    $scope.tab = selected;
    //}

    //$scope.saveSurvey = function (survey) {
    //    $scope.isSubmitting = true;
    //    survey.$update().finally(function(){
    //        $scope.isSubmitting = false;
    //        $location.path("/surveys/" + id); 
    //    });
    //}
});