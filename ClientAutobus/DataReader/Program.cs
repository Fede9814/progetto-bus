using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataReader.Sensors;
using CSRedis;

namespace DataReader
{
    class Program
    {
        static void Main(string[] args)
        {
            // init sensors
            List<ISensor> sensors = new List<ISensor>
            {
                new VirtualCoordinateSensor()
            };

            while (true)
            {
                foreach (ISensor sensor in sensors)
                {
                    Console.WriteLine(sensor.ToJson());

                    System.Threading.Thread.Sleep(5000);

                }

            }
        }
    }
}
