namespace PamagitMenzPoxitiliIDerjatVZalojnikax
{
    internal class Helper
    {
        private static DemkaEntities _demka;

        public static DemkaEntities GetContext(bool AddData = false)
        {
            if( _demka == null  || AddData)
                _demka = new DemkaEntities();
            return _demka;
        }

    }
}
