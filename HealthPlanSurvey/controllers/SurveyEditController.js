angular.module('SurveyWrangler').controller('SurveyEditController', function ($scope, Survey, $routeParams, $location) {
    var id = $routeParams.id;
    $scope.isSubmitting = false;
    Survey.get({ responseId: id }).$promise.then(function(data){
      data.ActivePlans.forEach(function(plan){
        var renewalDt = new Date(plan.ActivePlan.RenewalDate);
        var local = new Date(plan.ActivePlan.RenewalDate);
        local.setMinutes(renewalDt.getMinutes() - renewalDt.getTimezoneOffset());
        plan.ActivePlan.RenewalDate = local;
      });
      $scope.survey = data;
      console.log($scope.survey);
    });

    $scope.setSelected = function (selected) {
      $scope.tab = selected;
      //$scope.nextTab = next;
        //console.log($scope.tab)
    }

    $scope.saveSurvey = function (survey) {
        $scope.isSubmitting = true;
        survey.$update().finally(function(){
            $scope.isSubmitting = false;
            //$location.path("/surveys/" + id);
        });
    }

    $scope.changePlanCount = function() {
      alert("Plan Count= " + "888");
    }
});
