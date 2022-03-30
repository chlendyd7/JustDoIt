using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarManager
{
    public class DataManager
    {
        public static List<ParkingCar> Cars = new List<ParkingCar>();

        static DataManager()
        {
            Load();
        }

        public static void Load()
        {
            try
            {
                DBHelper.selectQuery();
                Cars.Clear();
                foreach (DataRow item in DBHelper.ds.Tables[0].Rows)
                {
                    ParkingCar car = new ParkingCar();
                    car.ParkingSpot = int.Parse(item["ParkingSpot"].ToString());
                    car.CarNumber = item["CarNumber"].ToString();
                    car.DriverName = item["DriverName"].ToString();
                    car.PhoneNumber = item["PhoneNumber"].ToString();
                    car.ParkingTime = item["ParkingTime"].ToString() == "" ? new DateTime() : DateTime.Parse(item["ParkingTime"].ToString());
                    Cars.Add(car);
                }

                //linq 사용
                //DBHelper.ds.Tables[0].Rows 에 '쿼리'가 구현되어 있지 않아서 안 된다.
                //Cars = (from item in DBHelper.ds.Tables[0].Rows 
                //        select new ParkingCar()
                //        {
                //            ParkingSpot = int.Parse(item["ParkingSpot"].ToString()),
                //            CarNumber = item["CarNumber"].ToString(),
                //            DriverName = item["DriverName"].ToString(),
                //            PhoneNumber = item["PhoneNumber"].ToString(),
                //            ParkingTime = item["ParkingTime"].ToString() == "" ? new DateTime() : DateTime.Parse(item["ParkingTime"].ToString())
                //        }).ToList<ParkingCar>();

            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message+Environment.NewLine+ex.StackTrace);
            }
        }

        
        public static void Save(string parkingSpotText, string carNumberText, string driverNameText, string phoneNumber, bool isRemove = false)
        {
            try
            {
                //주차 or 출차로 인하여 상태가 변하였으므로 update문을 호출하여 db table에도 값이 바뀔 수 있도록 한다.
                DBHelper.updateQuery(parkingSpotText, carNumberText, driverNameText, phoneNumber, isRemove);

            }
            catch (Exception exception)
            {
                System.Windows.Forms.MessageBox.Show(exception.Message + Environment.NewLine + exception.StackTrace);
            }
        }

        public static void PrintLog(string contents)
        {
            DirectoryInfo di = new DirectoryInfo("ParkingHistory");//폴더 경로

            if(!di.Exists) //bin폴더 안에, Debug나 Release 안에 실행파일이 있을 텐데, 같은 경로안에 ParkingHistory 폴더 없을 때
            {
                di.Create(); //ParkingHistory 폴더 만듦
            }

            //끝에 true의 의미
            //이거 없으면 한 텍스트파일에 글을 append하는 게 아니고
            //그 때 그 때 새로 만들어버림(= 덮어쓴다.)
            //여기서 appned는 확장한다. 이어서 쓴다. 이런 의미
            using (StreamWriter writer = new StreamWriter("ParkingHistory" + "\\" + "ParkingHistory" + ".txt", true))
            {
                writer.WriteLine(contents);
            }

        }

    }
}
