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
  public async Task<ActionResult<Keep[]>> GetAll()
  {
    try
    {
      Keep[] keeps = await _keepsService.GetAll();
      return Ok(keeps);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
}