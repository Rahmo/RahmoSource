using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using DocumentFormat.OpenXml.Bibliography;

namespace ICStars2_0.Model
{
   public class Inquiring
    {
       [DisplayName("First Name")]
       [Required]
  public string FirstName { get; set; }
       [DisplayName("Last Name")]
       [Required]
    public string LastName { get; set; }
    [DisplayName("Title ")]
    [Required]         
   public string Title { get; set; }
         [DisplayName("Organization")]
        [Required]
   public string Organization { get; set; }
         [DisplayName("Address")]
        [Required]
   public string Address { get;set ;}
  [DisplayName("City")]
   [Required]
public string City { get;set ;}
   [DisplayName("State")]
   [Required]
public string State { get;set ;}
        [DisplayName("Zip Code ")]
        [Required]
public string ZipCode { get;set ;}
       [DisplayName("Phone Number")]
       [Required]
public string PhoneNumber { get;set ;}
          [Required]
       [Display(Name = "Email Address")]
       [DataType(DataType.EmailAddress, ErrorMessage = "E-mail is not valid")]
       [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "E-mail is not valid")]
public string EmailAddress { get;set ;}
       [DisplayName(" Check to Subscribe to Our Mailing List ")]
public bool  MailingList { get;set ;}
       [DataType(DataType.MultilineText)]
       [DisplayName("Comment")]
       [Required]
       public string Comment { get;set ;}


    }
 
}
