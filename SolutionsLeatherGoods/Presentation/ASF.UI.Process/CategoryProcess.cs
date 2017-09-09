using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using ASF.Entities;
using ASF.Services.Contracts;
using ASF.UI.Process;

namespace ASF.UI.Process
{
    public class CategoryProcess : ProcessComponent
    {
        const String baseUrl = "rest/Category/";
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Category> SelectList()
        {
            var response = HttpGet<AllResponse>(baseUrl + "All", new Dictionary<string, object>(), MediaType.Json);
            return response.Result;
        }

        /// <summary>
        /// FindByID
        /// </summary>
        /// <returns></returns>
        public List<Category> FindByID(int id)
        {
            var response = HttpGet<AllResponse>(baseUrl + "Find/"+ id, new Dictionary<string, object>(), MediaType.Json);
            return response.Result;
        }

        public void add (Category cat)
        {
            var response = HttpPost<Category>(baseUrl + "Add/", cat ,MediaType.Json);

        }
        

    }
}