namespace KickStarter.Web
{
    public interface IDummyService
    {
        int DoSomething(int input);
    }

    internal class DummyService : IDummyService
    {
        public int DoSomething(int input)
        {
            return input*2;
        }
    }
}