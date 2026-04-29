using keepr.Services;

namespace keepr.Controllers;

[ApiController]
[Route("api/[controller]")]
public class KeepsController : ControllerBase
{
  private readonly KeepsService _keepsService;

  public KeepsController(KeepsService keepsService)
  {
    _keepsService = keepsService;
  }

  [HttpGet]
  public async Task<ActionResult<KeepDTO[]>> GetAll()
  {
    try
    {
      KeepDTO[] keeps = await _keepsService.GetAll();
      return Ok(keeps);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }

  [HttpGet("{id}")]
  public async Task<ActionResult<DetailedKeepDTO>> GetById(int id)
  {
    try
    {
      DetailedKeepDTO keep = await _keepsService.GetById(id);
      return Ok(keep);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
}