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
    string sql = @"
    SELECT
    keeps.id,
    keeps.name,
    img_url,
    creator_id,
    accounts.name AS creator_name,
    accounts.picture AS creator_picture
    FROM
    keeps
    INNER JOIN accounts ON accounts.id = creator_id;";

    var keeps = await _db.QueryAsync<KeepDTO>(sql);

    return keeps.ToArray();
  }
}