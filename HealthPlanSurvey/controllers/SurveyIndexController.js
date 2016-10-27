angular.module('SurveyWrangler').controller('SurveyIndexController', function (Survey, Broker, Client, $scope, $location, uiGridConstants) {
    $scope.surveys = Survey.query();

    $scope.brokers = Broker.query();
    $scope.clients = Client.query();

    $scope.highlightFilteredHeader = function (row, rowRenderIndex, col, colRenderIndex) {
        if (col.filters[0].term) {
            return 'header-filtered'
        } else {
            return '';
        }
    };

    var linkCellTemplate = '<div><a href="/#/surveys/{{row.entity.ResponseId}}">{{row.entity.OrganizationName}}</a></div>';
    $scope.gridOptions = {
        enableFiltering: true,
        onRegisterApi: function(gridApi){
            $scope.gridApi = gridApi;
        },
        columnDefs: [
            { field: 'ResponseId' },
            { field: 'MemberFirmId' },
            { field: 'Broker', headerCellClass: $scope.highlightFilteredHeader },
            { name: 'Organization', field: 'OrganizationName', headerCellClass: $scope.highlightFilteredHeader, cellTemplate: linkCellTemplate },
            { field: 'City', headerCellClass: $scope.highlightFilteredHeader },
            { name: 'State', field: 'StateCode', headerCellClass: $scope.highlightFilteredHeader },
            { field: 'ResponseStatus', headerCellClass: $scope.highlightFilteredHeader },
            { field: 'CreatedOn', headerCellClass: $scope.highlightFilteredHeader },
            { field: 'UpdatedOn', headerCellClass: $scope.highlightFilteredHeader } 
        ]
    };
    $scope.gridOptions.data = $scope.surveys;
    
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