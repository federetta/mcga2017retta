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
    public class ProductProcess : ProcessComponent
    {

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Product> SelectList()
        {
            var response = HttpGet<AllResponseProduct>("rest/Product/All", new Dictionary<string, object>(), MediaType.Json);
            return response.Result;
        }
        public List<Product> SelectPortada()
        {
            var response = HttpGet<AllResponseProduct>("rest/Product/SelectPortada", new Dictionary<string, object>(), MediaType.Json);
            return response.Result;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public Product Find(int id)
        {
            var path = "rest/Product/Find/" + id;
            var response = HttpGet<FindResponseProduct>(path, new Dictionary<string, object>(), MediaType.Json);
            return response.Result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public void Insert(Product prd)
        {
            var response = HttpPost<Product>("rest/Product/Add", prd, MediaType.Json);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public void Delete(int id)
        {
            var path = "rest/Product/Remove/" + id;
            var response = HttpGet<FindResponseProduct>(path, new Dictionary<string, object>(), MediaType.Json);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public void Edit(Product prd)
        {
            var response = HttpPost<Product>("rest/Product/Edit", prd, MediaType.Json);
        }
        ///
        public List<Product> SelectByCat(int id)
        {
            var path = "rest/Product/SelectByCat/" + id;
            var response = HttpGet<AllResponseProduct>(path, new Dictionary<string, object>(), MediaType.Json);
            return response.Result;
        }
        public List<Product> SelectByCookie(string id)
        {
            var path = "rest/Product/SelectByCookie/" + id;
            var response = HttpGet<AllResponseProduct>(path, new Dictionary<string, object>(), MediaType.Json);
            return response.Result;
        }
        public List<Product> Cookie(string cookie)
        {
            var path = "rest/Product/FindByCookie";
            var clase = "product";
            var response = HttpGet<AllResponseProduct>(path, MediaType.Json, cookie, clase);
            return response.Result;
        }

    }
}
