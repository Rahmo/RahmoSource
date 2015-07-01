﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("MeridaExtensionApplication", Schema = Const.Schema)]
    public class MeridaExtensionApplication
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [MaxLength(100)]
        [StringLength(100)]
        public string CampusConnectID { get; set; }

        [Required(ErrorMessage="This field is required.")]
        [MaxLength(100)]
        [StringLength(100)]
        public string Name { get; set; }

        [Required(ErrorMessage="This field is required.")]
        [MaxLength(2000)]
        [StringLength(2000)]
        [DataType(DataType.MultilineText)]
        [Display(Name = "What is your major(s)")]
        public string Major { get; set; }
        [Required(ErrorMessage="This field is required.")]
        [MaxLength(2000)]
        [StringLength(2000)]
        [DataType(DataType.MultilineText)]
        [Display(Name="Spanish language courses completed (including Winter Quarter 2014):")]
        public string SpanishLanguageCoursesCompleted { get; set; }
        [Required(ErrorMessage="This field is required.")]
        [MaxLength(2000)]
        [StringLength(2000)]
        [DataType(DataType.MultilineText)]
        [Display(Name = "What other service-learning courses have you taken prior to the Merida program?")]
        public string WhatCoursesPriorToMerida { get; set; }

        [Required(ErrorMessage="This field is required.")]
        [MaxLength(3000)]
        [StringLength(3000)]
        [DataType(DataType.MultilineText)]
        [Display(Name = "In 200 words, describe your interest in the Merida Spring Quarter Extension program.  Why are you interested in remaining in Merida?")]
        public string InterestInMerida_Why { get; set; }
        [Required(ErrorMessage="This field is required.")]
        [MaxLength(3000)]
        [StringLength(3000)]
        [DataType(DataType.MultilineText)]
        [Display(Name = "What skills and strengths do you feel you bring to the Spring program?")]
        public string SkillsStrengths { get; set; }
        [Required(ErrorMessage="This field is required.")]
        [MaxLength(3000)]
        [StringLength(3000)]
        [DataType(DataType.MultilineText)]
        [Display(Name = "What challenges do you believe you will face if you remain for Spring term and how do you plan to overcome them?")]
        public string Challenges_HowToOvercome { get; set; }
        [Required(ErrorMessage="This field is required.")]
        [MaxLength(3000)]
        [StringLength(3000)]
        [DataType(DataType.MultilineText)]
        [Display(Name = "How do you feel the Spring program will contribute to your academic and/or career goals?")]
        public string HowProgramContributeToCareer { get; set; }
        [Required(ErrorMessage="This field is required.")]
        [MaxLength(3000)]
        [StringLength(3000)]
        [DataType(DataType.MultilineText)]
        [Display(Name = "In 200 words, describe an experience from your work in the community in Merida and how it relates to an academic concept or theory introduced in CSS 201.")]
        public string ExperienceInMerida_HowRelatesToCSS201 { get; set; }
        [Required(ErrorMessage="This field is required.")]
        [MaxLength(300)]
        [StringLength(3000)]
        [DataType(DataType.MultilineText)]
        [Display(Name = "What characteristics do you have that will contribute to your success remaining in Merida serving and studying in a more independent manner?")]
        public string Characteristics { get; set; }

        public int YearOfApplication { get; set; }

        public MeridaExtensionApplication()
        {
            YearOfApplication = DateTime.Now.Year;
        }
    }
}
