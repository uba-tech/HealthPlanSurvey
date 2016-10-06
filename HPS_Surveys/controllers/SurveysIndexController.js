angular.module('SurveyWrangler').contoller('SurveysIndexController', function (Surveys, $scope) {
    $scope.surveys = Survey.query();
});