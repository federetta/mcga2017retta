﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using ASF.Entities;
using ASF.Data;

namespace ASF.Business
{
    /// <summary>
    /// ProductBusiness business component.
    /// </summary>
    public class ProductBusiness
    {

        /// <summary>
        /// Add method. 
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        public Product Add(Product product)
        {
            var productDac = new ProductDAC();
            return productDac.Create(product);
        }

        /// <summary>
        /// Delete method.
        /// </summary>
        /// <param name="id"></param>
        public void Remove(int id)
        {
            var productDac = new ProductDAC();
            productDac.DeleteById(id);
        }

        /// <summary>
        /// FindAll method.
        /// </summary>
        /// <returns></returns>
        public List<Product> All()
        {
            var productDac = new ProductDAC();
            var result = productDac.Select();
            return result;
        }

        /// <summary>
        /// Find method.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Product Find(int id)
        {
            var productDac = new ProductDAC();
            var result = productDac.SelectById(id);
            return result;
        }

        /// <summary>
        /// Update method.
        /// </summary>
        /// <param name="product"></param>
        public void Edit(Product product)
        {
            var productDac = new ProductDAC();
            productDac.UpdateById(product);
        }
        public List<Product> SelectByCat(int id)
        {
            var productDac = new ProductDAC();
            var result = productDac.SelectByCat(id);
            return result;
        }


    }
}
