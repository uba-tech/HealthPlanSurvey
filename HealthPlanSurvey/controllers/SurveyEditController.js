angular.module('SurveyWrangler').controller('SurveyEditController', function ($scope, Survey, $routeParams, $location) {
    var id = $routeParams.id;
    $scope.survey = Survey.get({ responseId: id })
    $scope.isSubmitting = false;
    console.log($scope.survey)

    $scope.saveSurvey = function (survey) {
        $scope.isSubmitting = true;
        survey.$update().finally(function(){
            $scope.isSubmitting = false;
            $location.path("/surveys/" + id); 
        });
    }
});