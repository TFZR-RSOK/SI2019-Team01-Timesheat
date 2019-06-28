﻿using System;
using System.Linq;
using System.Net;
using System.Security.Principal;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Security;
using TimeshEAT.Business.API;
using TimeshEAT.Business.Helpers;
using TimeshEAT.Business.Logging.Interfaces;
using TimeshEAT.Business.Models;
using TimeshEAT.Common;

namespace TimeshEAT.Web.Membership
{
	public class MemberPrincipal : IPrincipal
	{
		public MemberPrincipal(IIdentity identity, IApiClient api)
		{
			Identity = identity;
			_api = api ?? throw new ArgumentNullException(nameof(api));
		}

		private UserModel _user;
		private IApiClient _api;

		public IIdentity Identity { get; }

		public Tuple<bool, string> Login(string email, string password)
		{
			var loginCount = (int?)HttpContext.Current.Session["login_counter"] ?? 0;
			
			if(loginCount > Constants.MAX_LOGIN_ATTEMPTS)
			{
				WebCache.Set(HttpContext.Current.Request.UserHostAddress, true, 15);
				Lockout(email);
				return new Tuple<bool, string>(false, "Vaš nalog je blokiran zbog previše netačnih unosa kredencijala.");
			}
			else
			{
				var response = _api.Authorize(new AuthorizationModel() { Email = email, PasswordHash = password });

				HttpContext.Current.Session["login_counter"] = loginCount + 1;

				switch (response.Status)
				{
					case System.Net.HttpStatusCode.Unauthorized:
						return new Tuple<bool, string>(false, "Uneli ste nepostojaće kredencijale.");
					case System.Net.HttpStatusCode.Forbidden:
						return new Tuple<bool, string>(false, "Vaš nalog je blokiran.");
					case System.Net.HttpStatusCode.OK:
						HttpContext.Current.Session["login_counter"] = 0;
						_user = response.Data.User;
						FormsAuthentication.SetAuthCookie(_user.Email, true);
						return new Tuple<bool, string>(true, "");
					default:
						return new Tuple<bool, string>(false, response.Status.ToString());
				}
			}			
		}

		public void Lockout(string email = null)
		{
			email = !string.IsNullOrWhiteSpace(email) ? email : _user.Email;
			_api.Lockout(email);
		}

		public void Logout() =>
			FormsAuthentication.SignOut();

		public bool IsInRole(string role) =>
			_user.Roles.Any(x => x.Name.Equals(role));

		public bool ResetPassword(string newPassword, string token)
		{
			int? userId = WebCache.Get(token);
			if (!userId.HasValue) return false;

			_api.UpdatePassword(userId.Value, newPassword);
			WebCache.Remove(token);

			return true;
		}

		public void ForgotPassword(string email) {
			var userResponse = _api.GetUserByEmail<UserModel>(email);
			if(userResponse.Status.Equals(HttpStatusCode.OK) && userResponse.Data != null)
			{
				var emailSender = new EmailSender(DependencyResolver.Current.GetService<ILogger>());
				var token = TokenGenerator.GenerateToken();

				WebCache.Set(token, userResponse.Data.Id);
				string resetPasswordLink = $"{HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority)}/Authorization/ResetPassword?token={token}";
				emailSender.Send(email, AppSettings.DefaultEmail, "TimeshEAT - Link za resetovanje lozinke", resetPasswordLink);
			}

		}
	}
}