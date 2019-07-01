﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using TimeshEAT.Business.Models;
using TimeshEAT.Web.Interfaces;

namespace TimeshEAT.Web.Models.Render.Company
{
    public class CompanyDetailsRenderModel : IForm
    {
        public int Id { get; set; }
        public long Version { get; set; }

        [Required(ErrorMessage = "Ime je obavezno polje.")]
        [Display(Name = "Ime kompanije:")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Email je obavezno polje.")]
        [Display(Name = "Email:")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Dnevni popust je obavezno polje.")]
        [Display(Name = "Dnevni popust:")]
        public int DailyDiscount { get; set; }
        [Display(Name = "Jela:")]
        public IList<SelectListItem> MealList { get; set; } = new List<SelectListItem>()
        {
            new SelectListItem()
            {
                Disabled = true,
                Text = "Dodaj jelo",
                Value = "0"
            }
        };

        public static implicit operator CompanyModel(CompanyDetailsRenderModel company)
        {
            if (company == null)
                return null;

            return new CompanyModel(company.Name, company.Email, company.DailyDiscount, company.Id, company.Version);
        }
    }
}