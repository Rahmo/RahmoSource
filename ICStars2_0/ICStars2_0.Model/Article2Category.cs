using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("Article2Category", Schema = Const.Schema)]
    public class Article2Category
    {
        [Key, Column(Order = 1)]
        public int ArticleID { get; set; }
        [Key, Column(Order = 2)]
        public int CategoryID { get; set; }
    }
}
