﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Library.WebApp.Models.ViewModels
{
    public class CreateNewspaperNameViewModel
    {
        [Required(ErrorMessage = "This is a required field")]
        [StringLength(300, ErrorMessage = "Newspaper name length can't be more than 300 characters")]
        public string Name { get; set; }
    }
}