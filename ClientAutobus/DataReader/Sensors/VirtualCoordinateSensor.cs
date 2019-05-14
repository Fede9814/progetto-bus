using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using CSRedis;
using System.Threading.Tasks;


namespace DataReader.Sensors
{
    class VirtualCoordinateSensor : ICoordinate, ISensor
    {

        public String GetLatitudine()
        {
            Random random = new Random();
            var cord = new decimal((double)(random.NextDouble() * (20) + 10));
            var conv = cord.ToString();
            var cong = conv.Replace(',', '.');
            return cong;
        }

        public String GetLongitudine()
        {
            Random random = new Random(DateTime.Now.Second);
            var cord = new decimal((double)(random.NextDouble() * (20) + 10));
            var conv = cord.ToString();
            var cong = conv.Replace(',', '.');
            return cong;
        }

        public Boolean IsOpen()
        {
            bool valb;
            Random random = new Random(DateTime.Now.Second);
            int val = random.Next(0, 1);
            if (val == 1)
            {
                valb = true;
            }
            else
            {
                valb = false;
            }
            return valb;
        }

        public static bool CheckForInternetConnection()
        {
            try
            {
                using (var client = new WebClient())
                using (client.OpenRead("http://192.168.43.131:3000/ping"))
                {
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public void Pop(RedisClient redis)
        {
            var request = (HttpWebRequest)WebRequest.Create("http://192.168.43.131:3000");
            request.ContentType = "application/json";
            request.Method = "POST";

            using (var streamWriter = new StreamWriter(request.GetRequestStream()))
            {

                var j = redis.BLPop(30, "sensors_data");
                Console.WriteLine(j);
                streamWriter.Write(j);
                streamWriter.Flush();
                streamWriter.Close();

            }

            var response = (HttpWebResponse)request.GetResponse();
            using (var streamReader = new StreamReader(response.GetResponseStream()))
            {
                var result = streamReader.ReadToEnd();
            }
        }


        public string ToJson()
        {
            string finish="";
            var Timestamp = new DateTimeOffset(DateTime.UtcNow).ToUnixTimeSeconds();
            Random random = new Random();

            var request = (HttpWebRequest)WebRequest.Create("http://192.168.43.131:3000");
            request.ContentType = "application/json";
            request.Method = "POST";

            // configure Redis
            var redis = new RedisClient("127.0.0.1");

            if (CheckForInternetConnection())
            {
                try
                {
                    while (redis.Exists("sensors_data"))
                    {
                        Pop(redis);
                    }

                    using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                    {

                        string json = "{" +
                         "\n\t\"Mezzo\": \"" + "1" + "\"" + ",\n" +
                         "\t\"Latitudine\": \"" + GetLatitudine() + "\",\n" +
                         "\t\"Longitudine\": \"" + GetLongitudine() + "\",\n" +
                         "\t\"Time\": \"" + Timestamp + "000000000" + "\",\n" +
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

                }
                catch(Exception e)
                {
                    redis.LPush("sensors_data", finish);
                }                
            }
            else
            {
                string json = "{" +
                    "\n\t\"Mezzo\": \"" + "1" + "\"" + ",\n" +
                    "\t\"Latitudine\": \"" + GetLatitudine() + "\",\n" +
                    "\t\"Longitudine\": \"" + GetLongitudine() + "\",\n" +
                    "\t\"Time\": \"" + Timestamp + "000000000" + "\",\n" +
                    "\t\"Door1_open\": \"" + IsOpen() + "\",\n" +
                    "\t\"Door2_open\": \"" + IsOpen() + "\",\n" +
                    "\t\"Door3_open\": \"" + IsOpen() + "\",\n" +
                    "\t\"Door4_open\": \"" + IsOpen() + "\",\n" +
                    "\t\"N_ppl\": \"" + (random.Next(1, 10) + 10) + "\"\n" +
                    "}";

                finish = json;
                // push to redis queue
                redis.LPush("sensors_data", finish);
            }



            return finish;
        }
    }
}
