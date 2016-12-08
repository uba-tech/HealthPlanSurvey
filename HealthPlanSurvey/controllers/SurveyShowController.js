angular.module('SurveyWrangler').controller('SurveyShowController', function (Survey, $scope, $routeParams, $http, $location) {
    var id = $routeParams.id;
    //$scope.survey = Survey.get({ responseId: id });

    Survey.get({ responseId: id }).$promise.then(function (data) {
        localStorage.setItem('completedBy', JSON.stringify(data.GeneralResponse.CompletedBy));
        $scope.survey = data;
        console.log($scope.survey)
    }).catch(function (error) {
        console.log(error.statusText)
    });


    $scope.deleteSurvey = function (responseId) {
        console.log(responseId)
        $http({
            method: "POST",
            url: '/DesktopModules/HealthPlanSurveyService/API/survey/brokerdelete/'+responseId,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
           // data: { 'responseId' : responseId }
        })
        .success(function(response){
            //console.log(response)
            alert("Your survey has been deleted.");
            $location.path("/surveys");
        })
    };

});
