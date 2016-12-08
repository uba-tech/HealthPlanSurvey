angular.module('SurveyWrangler').directive("swConfirmClick", [ function(){
    return {
        priority: -1, // Must be lower than `ngClick` so that `stopImmediatePropagation()` is effective (post-link functions run in reverse).
        restrict: 'A',
        scope: { confirmFunction: "&swConfirmClick" },
        link: function (scope, element, attrs) {
            element.bind('click', function (e) {
                var message = attrs.swConfirmClickMessage ? attrs.swConfirmClickMessage : "Are you sure?";
                if (confirm(message)) {
                    scope.confirmFunction();
                }
            });
        }
    }
}
]);