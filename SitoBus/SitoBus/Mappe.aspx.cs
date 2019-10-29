using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using System.Text;
using System.Configuration;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using Microsoft.Ajax.Utilities;
using System.Diagnostics;
using System.Collections;

namespace SitoBus
{
    public partial class Mappe : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    var coutBus = GetListBus();

                    Debug.WriteLine(coutBus);

                    for (var x = 1; x <= coutBus; x++) {
                        DropDownList1.Items.Add(new ListItem("Veicolo " + x, x.ToString()));
                    }
                }
                catch (Exception x)
                {
                    System.Console.WriteLine(x);
                }
            }
        }
        public class NumBus
        {
            public DateTime time { get; set; }
            public int count { get; set; }
        }

        public int GetListBus()
        {
            var addr = "http://192.168.43.131:3000/getBus";
            var request = (HttpWebRequest)WebRequest.Create(addr);

            request.Method = "GET";
            var content = string.Empty;
            using (var response = (HttpWebResponse)request.GetResponse())
            {
                using (var stream = response.GetResponseStream())
                {
                    using (var sr = new StreamReader(stream))
                    {
                        content = sr.ReadToEnd();
                        var details = JsonConvert.DeserializeObject<List<NumBus>>(content);

                        NumBus mezzo = details[0];

                        return mezzo.count;
                    }
                }
            }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

    }
}