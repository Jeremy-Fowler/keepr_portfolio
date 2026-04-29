namespace keepr.Models;

public class Account : RepoItem<string>
{
  public string Name { get; set; }
  public string Email { get; set; }
  public string Picture { get; set; }
}
