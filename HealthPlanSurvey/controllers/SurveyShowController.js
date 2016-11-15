angular.module('SurveyWrangler').controller('SurveyShowController', function (Survey, $scope, $routeParams, $http, $location) {
    var id = $routeParams.id;
    $scope.survey = Survey.get({ responseId: id });
    //console.log($scope.survey)

    $scope.deleteSurvey = function (responseId) {
        console.log(responseId)
        $http({
            method: "POST",
            url: '/DesktopModules/HealthPlanSurveyService/API/survey/brokerdelete/',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            data: { 'responseId' : responseId }
        })
        .success(function(response){
            console.log(response)
        })
    };

});
