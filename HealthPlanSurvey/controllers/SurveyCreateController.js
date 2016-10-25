angular.module('SurveyWrangler').controller('SurveyCreateController', function ($scope, Survey, $location) {
    $scope.survey = new Survey();
    $scope.isSubmitting = false;

    $scope.saveSurvey = function (survey) {
        $scope.isSubmitting = true;
        console.log(survey)
        survey.$save().then(function () {
            //$location.path("/surveys");
        }).catch(function (errors) {
            //validations
        }).finally(function () {
            $scope.isSubmitting = false;
        })
    }
});