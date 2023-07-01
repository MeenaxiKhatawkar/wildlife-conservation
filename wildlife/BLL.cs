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
    public class BLL
    {
        public static int GetAdminInfo(GetInfo getInfo)
        {
            Database db = DatabaseFactory.CreateDatabase("connetionApplication");
            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                try
                {
                    int getId = DAL.AdminDetails(db,getInfo);
                    return getId;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        public static void InsertInfoAToTable(GetInfo getInfo)
        {
            Database db = DatabaseFactory.CreateDatabase("connetionApplication");
            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                try
                {
                    DAL.insert_info(db, getInfo);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}