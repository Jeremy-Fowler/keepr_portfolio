using keepr.Repositories;

namespace keepr.Services;

public class KeepsService
{
  private readonly KeepsRepository _repository;

  public KeepsService(KeepsRepository repository)
  {
    _repository = repository;
  }

  internal async Task<Keep[]> GetAll()
  {
    return await _repository.GetAll();
  }
}