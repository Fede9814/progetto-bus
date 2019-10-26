using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SitoBus
{
    public partial class Autobus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var coutBus = GetListBus();
                var str = "";
                for(int i = 1; i <= coutBus; i++)
                {
                    var firstBus = GetOneOfAllBus(i);
                    string json = JsonConvert.SerializeObject(firstBus);
                    str += json.ToString() + "\r\n";
                    Debug.WriteLine(str);

                }

                divpass.InnerText = str;
            }
            catch (Exception x)
            {
                System.Console.WriteLine(x);
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
        public List<Mezzo> GetOneOfAllBus(int num)
        {
            var addr = "http://192.168.43.131:3000/getFirstBus/" + num;
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
                        var details = JsonConvert.DeserializeObject<List<Mezzo>>(content);

                        return details;
                    }
                }
            }

        }
    }
}