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
}