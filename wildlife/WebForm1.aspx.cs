using Azure;
using Microsoft.Azure.KeyVault.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dhari
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {
            
            GetInfo getInfo = new GetInfo();
            getInfo.Email = (txtEmail.Value.ToString()).Trim();
            getInfo.Password = (txtPassword.Value.ToString()).Trim();
            int id = BLL.GetAdminInfo(getInfo);
            if(id > 0)
            {
                Response.Redirect("WebForm2.aspx");
            }
        }

        protected void btnSuscribe_ServerClick(object sender, EventArgs e)
        {
            GetInfo gt = new GetInfo();
            gt.Name = txtUserName.Value.ToString();
            gt.Email = txtSubEmail.Value.ToString();
            BLL.InsertInfoAToTable(gt);
            lblSub.InnerText = "Thanks For Subscribing With Us";
        }
    }
}