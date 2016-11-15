angular.module('SurveyWrangler').controller('SurveyCreateController', function ($scope, Survey, $location) {
    $scope.isSubmitting = false;
    //$scope.survey = Survey.getTemplate();
    Survey.getTemplate().$promise.then(function(data){
      data.ActivePlans.forEach(function(plan){
        var renewalDt = new Date(plan.ActivePlan.RenewalDate);
        var local = new Date(plan.ActivePlan.RenewalDate);
        local.setMinutes(renewalDt.getMinutes() - renewalDt.getTimezoneOffset());
        plan.ActivePlan.RenewalDate = local;
      });
      $scope.survey = data;
      console.log($scope.survey);
    }).catch(function(error){
      console.log(error)
    });
 
    
    $scope.setSelected = function (selected) {
      $scope.tab = selected;
      //$scope.nextTab = next;
        //console.log($scope.tab)
    }


    $scope.saveSurvey = function (survey) {
        $scope.isSubmitting = true;
        console.log(survey)
        survey.$save().then(function () {
            //$location.path("/surveys");
        }).catch(function (errors) {
            //validations
        }).finally(function () {
            $scope.isSubmitting = false;
        })
    }
});
