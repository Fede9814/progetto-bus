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
                        DropDownList1.Items.Add(new ListItem("Veicolo" + x, x.ToString()));
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

        public class Mezzo
        {
            public DateTime time { get; set; }
            public bool Door1_open { get; set; }
            public bool Door2_open { get; set; }
            public bool Door3_open { get; set; }
            public bool Door4_open { get; set; }
            public double Lat { get; set; }
            public double Long { get; set; }
            public int N_persone { get; set; }
            public int Num { get; set; }
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
            String num = DropDownList1.SelectedValue;
            try
            {
                var val = 0;
                Int32.TryParse(num, out val);
                var listBus = GetListBusByNum(val);
                string json = JsonConvert.SerializeObject(listBus);
                Debug.WriteLine(json);

                divpass.InnerText = json.ToString();            

            }
            catch (Exception x)
            {
                System.Console.WriteLine(x);
            }
        }
        public List<Mezzo> GetListBusByNum(int num)
        {
            var addr = "http://192.168.43.131:3000/getBus/" + num;
            var request = (HttpWebRequest)WebRequest.Create(addr);
            Debug.WriteLine(num);
            request.Method = "GET";
            var content = string.Empty;
            using (var response = (HttpWebResponse)request.GetResponse())
            {
                using (var stream = response.GetResponseStream())
                {
                    using (var sr = new StreamReader(stream))
                    {
                        content = sr.ReadToEnd();
                        var details = JsonConvert.DeserializeObject<List<Mezzo>>(content);

                        return details;
                    }
                }
            }
        }
    }
}