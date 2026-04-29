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
    string sql = @"
    SELECT
    keeps.id,
    keeps.name,
    img_url,
    creator_id,
    description,
    views,
    accounts.name AS creator_name,
    accounts.picture AS creator_picture,
    COUNT(vault_keeps.id) AS kept
    FROM keeps
    INNER JOIN accounts ON accounts.id = creator_id
    LEFT JOIN vault_keeps ON keeps.id = keep_id
    WHERE keeps.id = @Id
    GROUP BY keeps.id;";

    var keep = await _db.QueryAsync<DetailedKeepDTO>(sql, new { Id = id });

    return keep.SingleOrDefault();
  }
}