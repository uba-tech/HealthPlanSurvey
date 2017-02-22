angular.module('SurveyWrangler').controller('SurveyCarryForwardController', function ($scope, SurveyCarryForward, $routeParams, $location, Survey) {
    $scope.isSubmitting = false;
    $scope.removePlans = false;
    $scope.removedPlans = [];
    console.log($routeParams)
    var clientId = $routeParams.clientId;

    SurveyCarryForward.get({ responseId: clientId }).$promise.then(function (data) {
        data.ActivePlans.forEach(function (plan) {
            var renewalDt = new Date(plan.ActivePlan.RenewalDate);
            var local = new Date(plan.ActivePlan.RenewalDate);
            local.setMinutes(renewalDt.getMinutes() + renewalDt.getTimezoneOffset() + 1);
            plan.ActivePlan.RenewalDate = local;
        });
        $scope.survey = data;
        $scope.staticActivePlans = data.ActivePlans;
    }).catch(function (error) {
        alert("There was an error. Status: " + err.status + " - " + err.statusText);
        console.log(error)
    });

    $scope.setSelected = function (selected) {
        $scope.tab = selected;
        //$scope.nextTab = next;
        //console.log($scope.tab)
    };

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

    $scope.changedPlanCount = function(event, removeElem) {
        var count = event.target.value.split('number:')[1];
        if(count < $scope.survey.ActivePlans.length){
          $scope.removePlans = true;
        }else{
          $scope.removePlans = false;
          if(count > $scope.survey.ActivePlans.length){
            addAdditionalPlans(count);
          }
        }
    };

    $scope.removePlanClicked = function(event, plan) {
        var elem = event.target;
        if(elem.checked){
          removeFromActivePlans(plan);
        }else{
          addFromRemovedPlans(plan);
        }
    };

    function removeFromActivePlans(plan) {
      $scope.survey.ActivePlans = $scope.survey.ActivePlans.filter(function(el){
        return el.ActivePlan.ActivePlanId != plan.ActivePlan.ActivePlanId;
      });
      $scope.removedPlans.push(plan);
    };

    function addFromRemovedPlans(plan) {
      $scope.removedPlans = $scope.removedPlans.filter(function(el){
        return el.ActivePlan.ActivePlanId != plan.ActivePlan.ActivePlanId;
      });
      $scope.survey.ActivePlans.push(plan);
    };

    function addAdditionalPlans(count){
      var plansCount = count - $scope.survey.ActivePlans.length;
      createNewPlans(plansCount);
    };

    function successMethod(response) {
        console.log(response)
        alert("Your changes were saved successfully");
        $location.path("/surveys/" + response.ResponseId + "/edit");
        //var url = "http://" + $window.location.host + "/surveys/" + response.ResponseId + "/edit";
        //$window.location.href = url;
        //$scope.survey.GeneralResponse.ResponseId = response.ResponseId;
    };

    function errorMethod(err) {
        console.log(err)
        alert("There was an error. Status: " + err.status + " - " + err.statusText);
    };

    function createNewPlans(count) {
      var plans = [];
      Survey.getTemplate().$promise.then(function(data){
        for(var i=0; i<count; i++){
          var plan = data.ActivePlans[i];
          var renewalDt = new Date(plan.ActivePlan.RenewalDate);
          var local = new Date(plan.ActivePlan.RenewalDate);
          local.setMinutes(renewalDt.getMinutes() + renewalDt.getTimezoneOffset() + 1);
          plan.ActivePlan.RenewalDate = local;
          $scope.survey.ActivePlans.push(plan);
        }
        $scope.staticActivePlans = $scope.survey.ActivePlans;
        console.log($scope.survey.ActivePlans);
      }).catch(function(err){
        alert("There was an error. Status: " + err.status + ' - ' + err.statusText);
        console.log(error);
      });
    };
});
