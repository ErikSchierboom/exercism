using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;

public class User
{
    [JsonProperty("name")]
    public string Name { get; set; }
    
    [JsonProperty("owes")]
    public IDictionary<string, decimal> Owes { get; } = new SortedDictionary<string, decimal>();
    
    [JsonProperty("owed_by")]
    public IDictionary<string, decimal> OwedBy { get; } = new SortedDictionary<string, decimal>();
    
    [JsonProperty("balance")]
    public decimal Balance => OwedBy.Values.Sum() - Owes.Values.Sum();

    public void LendTo(User borrower, decimal amount)
    {
        var borrowerDebtAmount = amount + OwedByUser(borrower) - OwesUser(borrower);

        UpdateDebtForUser(borrower, borrowerDebtAmount);
        borrower.UpdateDebtForUser(this, -borrowerDebtAmount);
    }
    
    private decimal OwedByUser(User user) => OwedBy.TryGetValue(user.Name, out var owedByAmount) ? owedByAmount : 0.0m;
    private decimal OwesUser(User user) => Owes.TryGetValue(user.Name, out var owesAmount) ? owesAmount : 0.0m;

    private void UpdateDebtForUser(User user, decimal debt)
    {
        if (debt >= 0)
        {
            OwedBy[user.Name] = Math.Abs(debt);
            Owes.Remove(user.Name);
        }
        else
        {
            Owes[user.Name] = Math.Abs(debt);
            OwedBy.Remove(user.Name);
        }
    }
}

public class Database
{
    private readonly Dictionary<string, User> _usersByName;

    public Database(IEnumerable<User> users) => _usersByName = users.ToDictionary(user => user.Name);

    public IEnumerable<User> GetUsers(params string[] userNames)
    {
        if (userNames == null || userNames.Length == 0)
            return _usersByName.Values;

        return _usersByName.Values.Where(user => userNames.Contains(user.Name));
    }

    public User AddUser(string name)
    {
        _usersByName[name] = new User { Name = name };
        return _usersByName[name];
    }

    public User GetUser(string name) => _usersByName[name];
}

public class GetUsersPayload
{
    public string[] Users { get; set; }
}

public class PostAddPayload
{
    public string User { get; set; }
}

public class PostIOUPayload
{
    public string Lender { get; set; }
    public string Borrower { get; set; }
    public decimal Amount { get; set; }
}

internal static class SerializationExtensions
{   
    internal static T Deserialize<T>(this string json) => JsonConvert.DeserializeObject<T>(json);
    
    internal static string Serialize<T>(this T obj) => JsonConvert.SerializeObject(obj);
}

public class RestApi
{
    private readonly Database _db;
    
    public RestApi(string json) 
        => _db = new Database(json.Deserialize<User[]>());

    public string Get(string url, string json = null)
    {
        if (url == "/users")
            return HandleGetUsers(json ?? "{}");
        
        throw new ArgumentException("URL not found");
    }

    private string HandleGetUsers(string json)
    {
        var payload = json.Deserialize<GetUsersPayload>();
        return _db.GetUsers(payload.Users).Serialize();
    }

    public string Post(string url, string json)
    {
        if (url == "/add")
            return HandlePostAdd(json);
        
        if (url == "/iou")
            return HandlePostIOU(json);
        
        throw new ArgumentException("URL not found");
    }

    private string HandlePostAdd(string json)
    {
        var payload = json.Deserialize<PostAddPayload>();
        return _db.AddUser(payload.User).Serialize();
    }

    private string HandlePostIOU(string json)
    {
        var payload = json.Deserialize<PostIOUPayload>();

        var borrower = _db.GetUser(payload.Borrower);
        var lender = _db.GetUser(payload.Lender);
        
        lender.LendTo(borrower, payload.Amount);

        return _db.GetUsers(borrower.Name, lender.Name).Serialize();
    }
}