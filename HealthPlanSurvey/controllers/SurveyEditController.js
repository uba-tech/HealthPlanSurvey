angular.module('SurveyWrangler').controller('SurveyEditController', function ($scope, Survey, $route, $routeParams, $location, $anchorScroll) {
    var id = $routeParams.id;
    //$scope.tab = 10;
    $scope.setSelected(10);
    $scope.isSubmitting = false;
    Survey.get({ responseId: id }).$promise.then(function(data){
      data.ActivePlans.forEach(function(plan){
          //console.log("db: " + plan.ActivePlan.RenewalDate)
          var renewalDt = new Date(plan.ActivePlan.RenewalDate);
          //console.log("js: " + renewalDt)
          var local = new Date(plan.ActivePlan.RenewalDate);
          //console.log(local)
          //console.log("tz: " + renewalDt.getTimezoneOffset())
        local.setMinutes(renewalDt.getMinutes() + renewalDt.getTimezoneOffset() + 1);
        //console.log("adj: " + local)
        plan.ActivePlan.RenewalDate = local;
      });
      $scope.survey = data;
      console.log($scope.survey);
    }).catch(function (error) {
        alert("There was an error. Status: " + err.status + " - " + err.statusText);
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
        survey.$save()
            .then(successMethod)
            .catch(errorMethod)
            .finally(function () {
                $scope.isSubmitting = false;
            });
    };

    function successMethod(response) {
        console.log(response)
        alert("Your changes were saved successfully");
        $route.reload();
        //$location.path("/surveys/" + response.ResponseId + "/edit");
        //$scope.survey.GeneralResponse.ResponseId = response.ResponseId;
    };

    function errorMethod(err) {
        console.log(err)
        alert("There was an error. Status: " + err.status + " - " + err.statusText);
    };

    $scope.changePlanCount = function() {
      alert("Plan Count= " + "888");
    }

    // Autoscroll back to the top of page
    $scope.gotoTop = function() {
      $location.hash('top');

      $anchorScroll();
    };
   

});
