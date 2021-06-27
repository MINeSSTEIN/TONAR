using System.Windows.Controls;

namespace TONAR.Res.Code
{
    class StaticVisibility
    {
        public static Entities.TONAR_PCs_DBEntities e = new Entities.TONAR_PCs_DBEntities(); //База данных
        public static Frame f = new Frame(); //Фрейм главного окна
        public static Frame fi = new Frame(); //Фрейм для иерархии
        public static string mi = ""; //Выбранный пункт в иерархии
    }
}
