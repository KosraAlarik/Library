﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Library.WebApp.Models.ViewModels
{
    public class CreateCityViewModel : IValidatableObject
    {
        [Required(ErrorMessage = "This is a required field")]
        [StringLength(200, ErrorMessage = "City name length can't be more than 200 characters")]
        [RegularExpression(@"^[a-zA-ZА-Яа-яё]+(?:[\s-][a-zA-ZА-Яа-яё]+)*$", ErrorMessage = "City name can contain only letters and -")]
        public string Name { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (string.IsNullOrWhiteSpace(Name))
            {
                yield return new ValidationResult("The city Name cannot be empty", new[] { nameof(Name) });
            }
        }
    }
}