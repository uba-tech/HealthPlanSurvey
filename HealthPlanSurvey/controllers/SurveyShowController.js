angular.module('SurveyWrangler').controller('SurveyShowController', function (Survey, $scope, $routeParams, $location) {
    var id = $routeParams.id;
    $scope.survey = Survey.get({ responseId: id });
    //console.log($scope.survey)

    $scope.deleteSurvey = function (survey) {
        survey.$remove().then(function () {
            $location.path('/surveys');
        });
    }
});