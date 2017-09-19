

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
    /// <summary>
    /// 
    /// </summary>
    public class CategoryDac : DataAccessComponent
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public Category Create(Category category)
        {
            const string sqlStatement ="INSERT INTO dbo.Category ([Name]) " +
                "VALUES(@Name); SELECT SCOPE_IDENTITY();";

            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@Name", DbType.String, category.Name);
                //db.AddInParameter(cmd, "@CreatedOn", DbType.DateTime2, category.CreatedOn);
                //db.AddInParameter(cmd, "@CreatedBy", DbType.Int32, category.CreatedBy);
                //db.AddInParameter(cmd, "@ChangedOn", DbType.DateTime2, category.ChangedOn);
                //db.AddInParameter(cmd, "@ChangedBy", DbType.Int32, category.ChangedBy);
                // Obtener el valor de la primary key.
                category.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }

            return category;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        public void UpdateById(Category category)
        {
            const string sqlStatement = "UPDATE dbo.Category " +
                "SET [Name]=@Name, " +
                    "[CreatedOn]=@CreatedOn, " +
                    "[CreatedBy]=@CreatedBy, " +
                    "[ChangedOn]=@ChangedOn, " +
                    "[ChangedBy]=@ChangedBy " +
                "WHERE [Id]=@Id ";

            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@Name", DbType.String, category.Name);
                //db.AddInParameter(cmd, "@CreatedOn", DbType.DateTime2, category.CreatedOn);
                //db.AddInParameter(cmd, "@CreatedBy", DbType.Int32, category.CreatedBy);
                //db.AddInParameter(cmd, "@ChangedOn", DbType.DateTime2, category.ChangedOn);
                //db.AddInParameter(cmd, "@ChangedBy", DbType.Int32, category.ChangedBy);
                db.AddInParameter(cmd, "@Id", DbType.Int32, category.Id);

                db.ExecuteNonQuery(cmd);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        public void DeleteById(int id)
        {
            const string sqlStatement = "DELETE dbo.Category WHERE [Id]=@Id ";
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
        public Category SelectById(int id)
        {
            const string sqlStatement = "SELECT [Id], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy] " +
                "FROM dbo.Category WHERE [Id]=@Id ";

            Category category = null;
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (var dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read()) category = LoadCategory(dr);
                }
            }

            return category;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>		
        public List<Category> Select()
        {
            // WARNING! Performance
            const string sqlStatement = "SELECT [Id], [Name], [CreatedOn], [CreatedBy], [ChangedOn], [ChangedBy] FROM dbo.Category ";

            var result = new List<Category>();
            var db = DatabaseFactory.CreateDatabase(ConnectionName);
            using (var cmd = db.GetSqlStringCommand(sqlStatement))
            {
                using (var dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        var category = LoadCategory(dr); // Mapper
                        result.Add(category);
                    }
                }
            }

            return result;
        }

        /// <summary>
        /// Crea una nueva Categor�a desde un Datareader.
        /// </summary>
        /// <param name="dr">Objeto DataReader.</param>
        /// <returns>Retorna un objeto Categoria.</returns>		
        private static Category LoadCategory(IDataReader dr)
        {
            var category = new Category
            {
                Id = GetDataValue<int>(dr, "Id"),
                Name = GetDataValue<string>(dr, "Name"),
                CreatedOn = GetDataValue<DateTime>(dr, "CreatedOn"),
                CreatedBy = GetDataValue<int>(dr, "CreatedBy"),
                ChangedOn = GetDataValue<DateTime>(dr, "ChangedOn"),
                ChangedBy = GetDataValue<int>(dr, "ChangedBy")
            };
            return category;
        }
    }
}

