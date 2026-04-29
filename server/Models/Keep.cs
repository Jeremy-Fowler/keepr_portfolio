namespace keepr.Models;

public class Keep : RepoItem<int>
{
  public string Name { get; set; }
  public string Description { get; set; }
  public string ImgUrl { get; set; }
  public string Views { get; set; }
  public string CreatorId { get; set; }
}