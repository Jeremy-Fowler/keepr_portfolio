using keepr.Repositories;

namespace keepr.Services;

public class KeepsService
{
  private readonly KeepsRepository _repository;

  public KeepsService(KeepsRepository repository)
  {
    _repository = repository;
  }

  internal async Task<KeepDTO[]> GetAll()
  {
    return await _repository.GetAll();
  }

  internal async Task<DetailedKeepDTO> GetById(int id)
  {
    var keep = await _repository.GetById(id);

    if (keep == null) throw new Exception("No keep found with the id of: " + id);

    return keep;
  }
}