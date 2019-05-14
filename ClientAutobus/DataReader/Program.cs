using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataReader.Sensors;

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
                    // get current sensor value
                    var data = sensor.ToJson();
                    Console.WriteLine(data);

                    // wait 5 second
                    System.Threading.Thread.Sleep(5000);
                }
            }
        }
    }
}