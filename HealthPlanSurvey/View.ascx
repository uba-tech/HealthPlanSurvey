<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="UBA.Modules.HealthPlanSurvey.View" %>
<html ng-app="SurveyWrangler">
    <head>
        <title>Note Wrangler</title>
        <link rel="stylesheet" href="/DesktopModules/HealthPlanSurvey/Content/bootstrap.css" />
        <link rel="stylesheet" href="/DesktopModules/HealthPlanSurvey/Content/bootstrap-theme.css" />
    </head>
    <body>
        <h3>Manage Surveys</h3>
        <div ng-view class="container-fluid"></div>
    </body>
    <!-- vendor -->
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/angular.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/angular-route.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/Scripts/angular-resource.js"></script>

    <!-- App -->
    <script src="/DesktopModules/HealthPlanSurvey/javascript/app.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/javascript/routes.js"></script>
    <!-- Directives -->
    <script src="/DesktopModules/HealthPlanSurvey/directives/swCompanyDetails.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swGeneralInfo.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swMedicalPlan.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swPlanDesign.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swRxPlan.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swRetireePlan.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swSection125.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/directives/swActivePlan.js"></script>
    <!-- Controllers -->
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyIndexController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyCreateController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyEditController.js"></script>
    <script src="DesktopModules/HealthPlanSurvey/controllers/SurveyShowController.js"></script>
    <!-- Services -->
    <script src="/DesktopModules/HealthPlanSurvey/services/surveys.js"></script>
    <script src="/DesktopModules/HealthPlanSurvey/services/broker.js"></script>
    
</html>