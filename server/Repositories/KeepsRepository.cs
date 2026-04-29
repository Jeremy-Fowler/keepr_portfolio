namespace keepr.Repositories;

public class KeepsRepository
{
  private readonly IDbConnection _db;

  public KeepsRepository(IDbConnection db)
  {
    _db = db;
  }

  internal async Task<Keep[]> GetAll()
  {
    string sql = @"SELECT * FROM keeps";

    var keeps = await _db.QueryAsync<Keep>(sql);

    return keeps.ToArray();
  }
}