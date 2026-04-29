namespace keepr.Repositories;

public class KeepsRepository
{
  private readonly IDbConnection _db;

  public KeepsRepository(IDbConnection db)
  {
    _db = db;
  }

  internal async Task<KeepDTO[]> GetAll()
  {
    string sql = "SELECT * FROM keeps_with_creators;";

    var keeps = await _db.QueryAsync<KeepDTO>(sql);

    return keeps.ToArray();
  }

  internal async Task<DetailedKeepDTO> GetById(int id)
  {
    throw new Exception();
    string sql = @"
    
    ";
  }
}