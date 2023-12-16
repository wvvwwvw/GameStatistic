namespace GameStatistic
{
    public static class DB
    {
        private static GameStatisticsEntities3 database;
        public static GameStatisticsEntities3 db
        {
            get
            {
                if (database == null)
                    database = new GameStatisticsEntities3();

                return database;

            }
        }
    }
}
