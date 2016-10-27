angular.module('SurveyWrangler').controller('SurveyStartController', function ($scope, $uibModalInstance) {

    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };

    $scope.startNav = function (startType, id) {
        if (startType == 0) {
            // start a new survey
            $location.path("/surveys/new").then(function(ref){
                $uibModalInstance.close(ref);
            });

        } else {

            // carry forward survey data
            $location.path("/surveys/" + id + "/carryforward/").then(function(ref){
                $uibModalInstance.close(ref);
            });

        }
    };

});