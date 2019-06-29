﻿using System.Web.Mvc;
using TimeshEAT.Web.Attributes;
using TimeshEAT.Web.Interfaces;
using TimeshEAT.Web.Models.View;

namespace TimeshEAT.Web.Controllers
{
	[RoleAuthorize(Roles = "Administrator")]
	public class CompanyController : BaseController, INavigationController
    {
		public ActionResult Index()
        {
            return View(this.Navigation.GetPageViewModel<CompanyViewModel>());
        }
    }
}