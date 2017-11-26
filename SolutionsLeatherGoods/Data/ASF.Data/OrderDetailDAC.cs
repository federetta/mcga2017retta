﻿//====================================================================================================
// Base code generated with LeatherGoods - ASF.Data
// Architecture Solutions Foundation
//
// Generated by academic at LeatherGoods V 1.0 
//====================================================================================================

using System;
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
    public class OrderDetailDAC : DataAccessComponent
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="orderDetail"></param>
        /// <returns></returns>
        public OrderDetail Create(OrderDetail orderD)
        {
            //const string sqlStatement = "INSERT INTO dbo.OrderDetail2 ([OrderId], [ProductId], [Price], [Quantity] " +
            //    "VALUES(@OrderId, @ProductId, @Price, @Quantity);SELECT SCOPE_IDENTITY();";

            const string sqlStatement = "INSERT INTO dbo.OrderDetail2 ([OrderId], [ProductId], [Price], [Quantity]) " +
         "VALUES(@OrderId, @ProductId, @Price, @Quantity); SELECT SCOPE_IDENTITY();";

            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@OrderId", DbType.Int32, orderD.OrderId);
                db.AddInParameter(cmd, "@ProductId", DbType.Int32, orderD.ProductId);
                db.AddInParameter(cmd, "@Price", DbType.Decimal, orderD.Price);
                db.AddInParameter(cmd, "@Quantity", DbType.Int32, orderD.Quantity);
                //db.AddInParameter(cmd, "@CreatedBy", DbType.Int32, orderD.CreatedBy);
                // Obtener el valor de la primary key.
                orderD.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
                db.ExecuteNonQuery(cmd);
            }

            return orderD;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="orderDetail"></param>
        public void UpdateById(OrderDetail orderD)
        {
            const string sqlStatement = "UPDATE dbo.OrderDetail " +
                "SET [OrderId]=@OrderId, " +
                    "[ProductId]=@ProductId, " +
                    "[Price]=@Price, " +
                    "[Quantity]=@Quantity, " +
                    "[ChangedOn]=@ChangedOn, " +
                    "[ChangedBy]=@ChangedBy " +
                "WHERE [Id]=@Id ";

            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@OrderId", DbType.Int32, orderD.OrderId);
                db.AddInParameter(cmd, "@ProductId", DbType.Int32, orderD.ProductId);
                db.AddInParameter(cmd, "@Price", DbType.Decimal, orderD.Price);
                db.AddInParameter(cmd, "@Quantity", DbType.Int32, orderD.Quantity);
                db.AddInParameter(cmd, "@ChangedOn", DbType.DateTime2, orderD.ChangedOn);
                db.AddInParameter(cmd, "@ChangedBy", DbType.Int32, orderD.ChangedBy);
                db.AddInParameter(cmd, "@Id", DbType.Int32, orderD.Id);
                db.ExecuteNonQuery(cmd);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        public void DeleteById(int id)
        {
            const string sqlStatement = "DELETE dbo.OrderDetail WHERE [Id]=@Id ";
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
        public OrderDetail SelectById(int id)
        {
            const string sqlStatement = "SELECT [Id], [OrderId], [ProductId], [Price], [Quantity], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy] " +
                "FROM dbo.OrderDetail WHERE [Id]=@Id ";

            OrderDetail orderD = null;
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (var dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read()) orderD = LoadOrderDetail(dr);
                }
            }

            return orderD;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>		
        public List<OrderDetail> Select()
        {
            // WARNING! Performance
            const string sqlStatement = "SELECT [Id], [OrderId], [ProductId], [Price], [Quantity], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy] FROM dbo.OrderDetail ";

            var result = new List<OrderDetail>();
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                using (var dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        var orderD = LoadOrderDetail(dr); // Mapper
                        result.Add(orderD);
                    }
                }
            }

            return result;
        }

        /// <summary>
        /// Crea un nuevo OrderDetail desde un Datareader.
        /// </summary>
        /// <param name="dr">Objeto DataReader.</param>
        /// <returns>Retorna un objeto OrderDetail.</returns>		
        private static OrderDetail LoadOrderDetail(IDataReader dr)
        {
            var orderD = new OrderDetail
            {
                Id = GetDataValue<int>(dr, "Id"),
                OrderId = GetDataValue<int>(dr, "OrderId"),
                ProductId = GetDataValue<int>(dr, "ProductId"),
                Price = GetDataValue<double>(dr, "Price"),
                Quantity = GetDataValue<int>(dr, "Quantity"),
                CreatedOn = GetDataValue<DateTime>(dr, "CreatedOn"),
                CreatedBy = GetDataValue<int>(dr, "CreatedBy"),
                ChangedOn = GetDataValue<DateTime>(dr, "ChangedOn"),
                ChangedBy = GetDataValue<int>(dr, "ChangedBy")
            };

            return orderD;
        }

    }
}
