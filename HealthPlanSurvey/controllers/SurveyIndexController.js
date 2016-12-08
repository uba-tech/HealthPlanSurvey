angular.module('SurveyWrangler').controller('SurveyIndexController', function (Survey, Broker, Client, $scope, $location, $http, uiGridConstants) {
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

    var linkCellTemplate = '<div><a href="#/surveys/{{row.entity.ResponseId}}">{{row.entity.OrganizationName}}</a></div>';
    var validationCellTemplate = '<div><a ng-click="grid.appScope.validateSurvey(row.entity.ResponseId)" class="btn btn-success btn-xs" aria-label="Validate" title="Validate Survey"><span class="fa fa-check" aria-hidden="true"></span></a></div>';
    $scope.gridOptions = {
        data: $scope.surveys,
        enableFiltering: true,
        onRegisterApi: function(gridApi){
            $scope.gridApi = gridApi;
        },
        columnDefs: [
            //{ field: 'ResponseId' },
            //{ field: 'MemberFirmId' },
            { field: 'Broker', width: '22%', headerCellClass: $scope.highlightFilteredHeader },
            { name: 'Organization', field: 'OrganizationName', width: '22%', headerCellClass: $scope.highlightFilteredHeader, cellTemplate: linkCellTemplate },
            { field: 'City', width: '12%', headerCellClass: $scope.highlightFilteredHeader },
            { name: 'State', field: 'StateCode', width: '6%', headerCellClass: $scope.highlightFilteredHeader },
            { name: 'Status', field: 'ResponseStatus', width: '10%', headerCellClass: $scope.highlightFilteredHeader },
            { name: 'Created On', field: 'CreatedOn', width: '10%', headerCellClass: $scope.highlightFilteredHeader, type: 'date', cellFilter: 'date:\'MM/dd/yyyy\'' },
            { name: 'Updated On', field: 'UpdatedOn', width: '10%', headerCellClass: $scope.highlightFilteredHeader, type: 'date', cellFilter: 'date:\'MM/dd/yyyy\'' },
            { name: 'Validate', width: '7%', cellClass: 'ui-grid-vcenter', cellTemplate: validationCellTemplate }
        ]
    };


    $scope.startSurvey = function (startType, clientId, brokerId) {
        $scope.isStarting = true;
        if (startType == 0) {
            // start a new survey
            $location.path("/surveys/new/" + brokerId);
        } else {
            // carry forward survey data
            $location.path("/surveys/" + clientId + "/carryforward");
        }
        $scope.isStarting = false;
    };

    $scope.validateSurvey = function (responseId) {
        console.log(responseId)
        $http({
            method: "POST",
            url: '/DesktopModules/HealthPlanSurveyService/API/survey/validate/' + responseId,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
            //data: { 'responseId' : id }
        })
        .success(function(response){
            console.log(response)
        })
    };

    console.log($scope.surveys)
    console.log($scope.brokers)
    console.log($scope.clients)
});
