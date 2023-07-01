using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace Dhari
{
    public class DAL
    {
        public static int AdminDetails(Database db,GetInfo gt)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("SELECT FId from AdminInfo where FEmail=@Email and FPassword=@Password");
            DbCommand dbCommand = db.GetSqlStringCommand(stringBuilder.ToString());
            db.AddInParameter(dbCommand, "@Email", DbType.AnsiString, gt.Email);
            db.AddInParameter(dbCommand, "@Password", DbType.AnsiString, gt.Password);
            dbCommand.CommandType = CommandType.Text;
            int id = 0;
            object obj = db.ExecuteScalar(dbCommand);
            if (obj != null)
            {
                int.TryParse(obj.ToString(), out id);
            }
            return id;
        }
        public static void insert_info(Database db, GetInfo gt)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("INSERT INTO SubDetails(FName, FEmail) VALUES (@Name,@Email)");
            DbCommand dbCommand = db.GetSqlStringCommand(stringBuilder.ToString());
            dbCommand.CommandType = CommandType.Text;
            db.AddInParameter(dbCommand, "@Name", DbType.AnsiString, gt.Name);
            db.AddInParameter(dbCommand, "@Email", DbType.AnsiString, gt.Email);
            db.ExecuteNonQuery(dbCommand);
        }
    }
}