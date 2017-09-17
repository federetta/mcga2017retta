using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASF.UI.WbSite.Constants
{
    public class DataCacheSettings
    {
        public static class CategoryDataCache
        {
            public const string key = "Category";
            public static readonly TimeSpan SlidingExpiration = TimeSpan.FromDays(1);
        }

    }
}