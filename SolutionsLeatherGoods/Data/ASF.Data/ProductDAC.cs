﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using ASF.Entities;

namespace ASF.Data
{
    public class ProductDAC : DataAccessComponent
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        public Product Create(Product product)
        {
            const string sqlStatement = "INSERT INTO dbo.Product ([Title], [Description], [DealerId], [Image], [Price], [CreatedBy]) " +
                "VALUES(@Title, @Description, @DealerId, @Image, @Price, @CreatedBy); SELECT SCOPE_IDENTITY();";

            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@Title", DbType.String, product.Title);
                db.AddInParameter(cmd, "@Description", DbType.String, product.Description);
                db.AddInParameter(cmd, "@DealerId", DbType.Int32, product.DealerId);
                db.AddInParameter(cmd, "@Image", DbType.String, product.Image);
                db.AddInParameter(cmd, "@Price", DbType.Decimal, product.Price);
                db.AddInParameter(cmd, "@CreatedBy", DbType.Int32, product.CreatedBy);
                // Obtener el valor de la primary key.
                product.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }

            return product;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="product"></param>
        public void UpdateById(Product product)
        {
            const string sqlStatement = "UPDATE dbo.Product " +
                "SET [Title]=@Title, " +
                    "[Description]=@Description, " +
                    "[DealerId]=@DealerId, " +
                    "[Image]=@Image, " +
                    "[Price]=@Price, " +
                    "[QuantitySold]=@QuantitySold, " +
                    "[ChangedOn]=@ChangedOn, " +
                    "[ChangedBy]=@ChangedBy " +
                "WHERE [Id]=@Id ";

            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@Title", DbType.String, product.Title);
                db.AddInParameter(cmd, "@Description", DbType.String, product.Description);
                db.AddInParameter(cmd, "@DealerId", DbType.Int32, product.DealerId);
                db.AddInParameter(cmd, "@Image", DbType.String, product.Image);
                db.AddInParameter(cmd, "@Price", DbType.Decimal, product.Price);
                db.AddInParameter(cmd, "@QuantitySold", DbType.Int32, product.QuantitySold);
                db.AddInParameter(cmd, "@ChangedOn", DbType.DateTime2, product.ChangedOn);
                db.AddInParameter(cmd, "@ChangedBy", DbType.Int32, product.ChangedBy);
                db.AddInParameter(cmd, "@Id", DbType.Int32, product.Id);
                db.ExecuteNonQuery(cmd);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        public void DeleteById(int id)
        {
            const string sqlStatement = "DELETE dbo.Product WHERE [Id]=@Id ";
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Product SelectById(int id)
        {
            const string sqlStatement = "SELECT [Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy] " +
                "FROM dbo.Product WHERE [Id]=@Id ";

            Product product = null;
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (var dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read()) product = LoadProduct(dr);
                }
            }

            return product;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>		
        public List<Product> Select()
        {
            // WARNING! Performance
            const string sqlStatement = "SELECT [Id], [Title], [Description], [DealerId], [Image], [Price], [QuantitySold], [AvgStars], [Rowid], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy] FROM dbo.Product ";

            var result = new List<Product>();
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                using (var dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        var product = LoadProduct(dr); // Mapper
                        result.Add(product);
                    }
                }
            }

            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>		
        public List<Product> SelectByCat(int id)
        {
            // WARNING! Performance
            const string sqlStatement = "SELECT [id], [Title], [Description], [Image], [Price] FROM dbo.VW_Poductos WHERE [cid]=@cid";

            var result = new List<Product>();
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@cid", DbType.Int32, id);
                using (var dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        var product = LoadProductView(dr); // Mapper
                        result.Add(product);
                    }
                }
            }

            return result;
        }

        public List<Product> FindByCookie(string id)
        {
            const string sqlStatement = "SELECT [Title], [Description], [Price] " +
                "FROM dbo.VW_CarritoActivo WHERE [Cookie]= @id ";

            var result = new List<Product>();
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@id", DbType.String, id);
                using (var dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        var product = CarritoActivo(dr); // Mapper
                        result.Add(product);
                    }
                }
            }

            return result;
        }

        /// <summary>
        /// Crea un nuevo Product desde un Datareader.
        /// </summary>
        /// <param name="dr">Objeto DataReader.</param>
        /// <returns>Retorna un objeto Product.</returns>		
        private static Product LoadProduct(IDataReader dr)
        {
            var product = new Product
            {
                Id = GetDataValue<int>(dr, "Id"),
                Title = GetDataValue<string>(dr, "Title"),
                Description = GetDataValue<string>(dr, "Description"),
                DealerId = GetDataValue<int>(dr, "DealerId"),
                Image = GetDataValue<string>(dr, "Image"),
                Price = GetDataValue<double>(dr, "Price"),
                QuantitySold = GetDataValue<int>(dr, "QuantitySold"),
                AvgStars = GetDataValue<double>(dr, "AvgStars"),
                Rowid = GetDataValue<Guid>(dr, "Rowid"),
                CreatedOn = GetDataValue<DateTime>(dr, "CreatedOn"),
                CreatedBy = GetDataValue<int>(dr, "CreatedBy"),
                ChangedOn = GetDataValue<DateTime>(dr, "ChangedOn"),
                ChangedBy = GetDataValue<int>(dr, "ChangedBy")
            };
            return product;
        }

        private static Product LoadProductView(IDataReader dr)
        {
            var product = new Product
            {
                Id = GetDataValue<int>(dr, "Id"),
                Title = GetDataValue<string>(dr, "Title"),
                Description = GetDataValue<string>(dr, "Description"),
                Image = GetDataValue<string>(dr, "Image"),
                Price = GetDataValue<double>(dr, "Price"),
            };
            return product;
        }

        private static Product CarritoActivo(IDataReader dr)
        {
            var product = new Product
            {
                Title = GetDataValue<string>(dr, "Title"),
                Description = GetDataValue<string>(dr, "Description"),
                Price = GetDataValue<double>(dr, "Price"),
            };
            return product;
        }


    }
}
