<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="UBA.Modules.HPS_Surveys.View" %>
<html ng-app="SurveyWrangler">
    <head>
        <title>Note Wrangler</title>
        <link rel="stylesheet" href="Content/bootstrap.css" />
        <link rel="stylesheet" href="Content/bootstrap-theme.css" />
    </head>
    <body>
        <h3>Greetings Surveyland</h3>
        <div ng-view class="container-fluid"></div>
    </body>
    <!-- vendor -->
    <script src="Scripts/angular.js"></script>
    <script src="Scripts/angular-route.js"></script>
    <script src="Scripts/angular-resource.js"></script>

    <!-- App -->
    <script src="javascript/app.js"></script>
    <script src="javascript/route.js"></script>
    <!-- Directives -->
    <!-- Controllers -->
    <script src="controllers/SurveysIndexController.js"></script>
    <script src="controllers/SurveysCreateController.js"></script>
    <script src="controllers/SurveysEditController.js"></script>
    <script src="controllers/SurveysShowController.js"></script>
    <!-- Services -->
    <script src="services/surveys.js"></script>
    
</html>