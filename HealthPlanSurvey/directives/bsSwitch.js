angular.module('SurveyWrangler').directive('bsSwitch', function() {
  return {
    restrict: 'A',
    require: 'ngModel',
    link: function(scope, element, attrs, ngModelCtrl) {
      $(element).bootstrapSwitch({
        onSwitchChange: function(event, state) {
          scope.$apply(function() {
            ngModelCtrl.$setViewValue(state);
          });
        }
      });

      var dereg = scope.$watch(function() {
        return ngModelCtrl.$modelValue;
      }, function(newVal) {
        $(element).bootstrapSwitch('state', !!newVal, true);
        dereg();
      });
    }
  }
});
