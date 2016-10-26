angular.module('SurveyWrangler').controller('SurveyIndexController', function(Survey, Broker, $scope) {
    $scope.surveys = Survey.query();

    $scope.brokers = Broker.query();

    $scope.isFiltering = false;
    $scope.surveyFilter = {
        BrokerNo : [{number: 0}],
        ResponseStatusId : [{number: 0}],
        ClientName : ""
    };

    $scope.filterSurvey = function (filter) {
        $scope.isFiltering = true;
        Survey.get({ filter: filter }).finally(function(){
            $scope.isFiltering = false;
            //$location.path("/surveys/" + id); 
        });
    }

    console.log($scope.surveys)
    console.log($scope.brokers)
});