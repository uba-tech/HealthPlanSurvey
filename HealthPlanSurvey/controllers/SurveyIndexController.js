angular.module('SurveyWrangler').controller('SurveyIndexController', function(Survey, $scope) {
    $scope.surveys = Survey.query();
    console.log($scope.surveys)
});