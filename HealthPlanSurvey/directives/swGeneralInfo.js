angular.module('SurveyWrangler').directive("swGeneralInfo", function () {
    return {
        replace: true,
        restrict:'E',
        action: "&",
        templateUrl: '/DesktopModules/HealthPlanSurvey/templates/response/GeneralInfo.html',
        scope: {
            response: '=ngModel'
        },
        link: function(scope, elem, attrs) {
          var changeSelect = angular.element(elem[0].querySelector('[ng-model="response.NumberActivePlansOfferedTypeId"]'));
          var removeElem = angular.element(elem[0].querySelector('.remove-active-plans'));
          changeSelect.bind('change', function(event){
            scope.$apply(function(){
              scope.$parent.changedPlanCount(event, removeElem);
            });
          });
          // removeInputs.forEach(function(element){
          //   element.bind('click', function(event){
          //     scope.$apply(function(event){
          //       scope.$parent.clickedRemovePlan(event);
          //     });
          //   });
          // });
        }
    }
});
