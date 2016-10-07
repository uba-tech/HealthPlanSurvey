using DotNetNuke.Entities.Modules;
using System;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;
using DotNetNuke.Security;

namespace UBA.Modules.HealthPlanSurvey
{
    public partial class View : HealthPlanSurveyModuleBase, IActionable
    {
        public ModuleActionCollection ModuleActions
        {
            get
            {
                var actions = new ModuleActionCollection
                    {
                        {
                            GetNextActionID(), Localization.GetString("EditModule", LocalResourceFile), "", "", "",
                            EditUrl(), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                return actions;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}