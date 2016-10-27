angular.module('SurveyWrangler').controller('SurveyIndexController', function (Survey, Broker, Client, $scope, $location) {
    $scope.surveys = Survey.query();

    $scope.brokers = Broker.query();
    $scope.clients = Client.query();
    //$scope.surveyFilterBrokerNo = { 
    //    AllowPTG:true,
    //    BrokerDeletedCount: null,
    //    BrokerName:    "pizza",
    //    BrokerNo:    -1,
    //    Completedount:    null,
    //    DontSendSaveEmail:    false,
    //    FinishedCount:    null,
    //    InProcessCount:    null,
    //    MemberFirmID:    -1,
    //    SurveyContactEmail:    "",
    //    SurveyContactName:    "",
    //    WebID:    "" };

    $scope.isFiltering = false;
    //$scope.surveyFilter = {
    //    BrokerNo : [{number: 0}],
    //    ResponseStatusId : [{number: 0}],
    //    ClientName : ""
    //};

    $scope.filterSurvey = function (filter) {
        $scope.isFiltering = true;
        Survey.get({ filter: filter }).finally(function () {
            $scope.isFiltering = false;
            //$location.path("/surveys/" + id); 
        });
    }

    
    $scope.startSurvey = function (startType, id) {
        $scope.isStarting = true;
        if (startType == 0) {
            // start a new survey
            $location.path("/surveys/new");
          
        } else {

            // carry forward survey data
            $location.path("/surveys/" + id + "/carryforward/");
          
        }
        $scope.isStarting = false;
    }

    console.log($scope.surveys)
    console.log($scope.brokers)
    console.log($scope.clients)
});