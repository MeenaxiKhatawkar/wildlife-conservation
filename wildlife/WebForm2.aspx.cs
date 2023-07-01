using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;


namespace Dhari
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGridView();
        }
        void LoadGridView()
        {
            DataTable dtbl = new DataTable();
            Database db = DatabaseFactory.CreateDatabase("connetionApplication");
            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("SELECT FSId,FName,FEmail from SubDetails");
                DbCommand dbCommand = db.GetSqlStringCommand(stringBuilder.ToString());
                dbCommand.CommandType = CommandType.Text;
                dtbl = db.ExecuteDataSet(dbCommand).Tables[0];

            }
            if (dtbl.Rows.Count > 0)
            {
                userGridViewDetails.DataSource = dtbl;
                userGridViewDetails.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                userGridViewDetails.DataSource = dtbl;
                userGridViewDetails.DataBind();
                userGridViewDetails.Rows[0].Cells.Clear();
                userGridViewDetails.Rows[0].Cells.Add(new TableCell());
                userGridViewDetails.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                userGridViewDetails.Rows[0].Cells[0].Text = "No Data Found..!";
                userGridViewDetails.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
    }
}