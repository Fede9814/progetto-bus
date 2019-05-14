using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;



namespace DataReader.Sensors
{
    class VirtualCoordinateSensor : ICoordinate, ISensor
    {

        public decimal GetLatitudine()
        {
            Random random = new Random();
            return new decimal((double)(random.NextDouble() * (20) + 10));

        }

        public decimal GetLongitudine()
        {
            Random random = new Random(DateTime.Now.Second);
            return new decimal((double)(random.NextDouble() * (20) + 10));
        }

        public Boolean IsOpen()
        {
            bool valb;
            Random random = new Random(DateTime.Now.Second);
            int val = random.Next(0, 1);
            if(val == 1)
            {
                valb = true;
            }
            else
            {
                valb = false;
            }
            return valb;
        }

        public string ToJson()
        {
            string finish;
            var Timestamp = new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds();

            var time = (DateTime.Now);

            Console.WriteLine(time);

            Random random = new Random();

            var request = (HttpWebRequest)WebRequest.Create("http://127.0.0.1:3000");
            request.ContentType = "application/json";
            request.Method = "POST";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {
                string json = "{" +
                   "\n\t\"Mezzo\": \"" + "1"+ "\"" + ",\n" +
                   "\t\"Latitudine\": \"" + GetLatitudine() + "\",\n" +
                   "\t\"Longitudine\": \"" + GetLongitudine() + "\",\n" +
                   "\t\"Time\": \"" + Timestamp.ToString() +"000000000" + "\",\n" +
                   "\t\"Door1_open\": \"" + IsOpen() + "\",\n" +
                   "\t\"Door2_open\": \"" + IsOpen() + "\",\n" +
                   "\t\"Door3_open\": \"" + IsOpen() + "\",\n" +
                   "\t\"Door4_open\": \"" + IsOpen() + "\",\n" +
                   "\t\"N_ppl\": \"" + (random.Next(1, 10) + 10) + "\"\n" +
                   "}";

                finish = json;



                /*"{\"Mezzo\":\""+ (random.Next(1, 10)) + "\"," +
               "\"password\":\"bla\"}";*/

                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();
            }

            var response = (HttpWebResponse)request.GetResponse();
            using (var streamReader = new StreamReader(response.GetResponseStream()))
            {
                var result = streamReader.ReadToEnd();
            }




            return finish;
        }
    }
}
