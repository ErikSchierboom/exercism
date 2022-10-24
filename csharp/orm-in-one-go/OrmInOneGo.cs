using System;

public class Orm : IDisposable
{
    private Database database;

    public Orm(Database database) => this.database = database;

    public void Write(string data)
    {
        using var db = database;
        db.BeginTransaction();
        db.Write(data);    
        db.EndTransaction();
    }

    public bool WriteSafely(string data)
    {
        try
        {
            Write(data);
            return true;
        }
        catch
        {
            return false;
        }
    }

    public void Dispose() => database?.Dispose();
}
