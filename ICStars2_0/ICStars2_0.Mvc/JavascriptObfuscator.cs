using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Optimization;
using ICStars2_0.Common;
using ICStars2_0.Common.ScriptPacker;

namespace ICStars2_0.Mvc
{
    public class JavascriptObfuscator : IBundleTransform
    {
        public void Process(BundleContext context, BundleResponse response)
        {
            var p = new ECMAScriptPacker(ECMAScriptPacker.PackerEncoding.Normal, true, false);

            response.Content = p.Pack(response.Content);
        }
    }
}
