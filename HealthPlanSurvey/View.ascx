<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="UBA.Modules.HealthPlanSurvey.View" %>
<html ng-app="SurveyWrangler">
    <head>
        <title>Survey Wrangler</title>
        <link rel="stylesheet" href="/DesktopModules/HealthPlanSurvey/Content/bootstrap.css" />
        <link rel="stylesheet" href="/DesktopModules/HealthPlanSurvey/Content/bootstrap-theme.css" />
        <link rel="stylesheet" href="/DesktopModules/HealthPlanSurvey/Content/bootstrap-select.uba.min.css" />
		    <link rel="stylesheet" href="/DesktopModules/HealthPlanSurvey/Content/bootstrap-switch.min.css" />
        <link rel="styleSheet" href="/DesktopModules/HealthPlanSurvey/Content/ui-bootstrap-csp.css"/>
        <link rel="styleSheet" href="/DesktopModules/HealthPlanSurvey/Content/ui-grid.min.css"/>
    </head>
    <body>
        <div ng-view class="container-fluid"></div>
    </body>
    <!-- vendor -->
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/angular.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/angular-route.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/angular-resource.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/bootstrap-select.min.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/bootstrap-switch.min.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/bootstrapvalidator.min.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/angular-ui/ui-bootstrap-tpls.min.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/ui-grid.min.js"></script>

    <!-- App -->
    <script src="/DesktopModules/HealthPlanSurvey/javascript/app.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/javascript/routes.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/javascript/validation.js"></script>

    <!-- Directives -->
    <script src="/DesktopModules/HealthPlanSurvey/directives/swCompanyDetails.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swGeneralInfo.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swMedicalPlan.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swPlanDesign.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swRxPlan.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swRetireePlan.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swSection125.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swActivePlan.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/bsSwitch.js"></script>
    <!-- Filters -->
    <!-- Controllers -->
    <script src="DesktopModules/HealthPlanSurvey/controllers/RenewalDateController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/PersonController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyIndexController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyCreateController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyEditController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyShowController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyCarryForwardController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/ReferenceController.js"></script>
    <!-- Services -->
    <script src="/DesktopModules/HealthPlanSurvey/services/surveys.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/services/broker.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/services/client.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/services/person.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/services/reference.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/services/surveyCarryForward.js"></script>
</html>
