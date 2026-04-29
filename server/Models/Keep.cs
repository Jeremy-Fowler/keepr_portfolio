namespace keepr.Models;

public class KeepEntity : RepoItem<int>
{
  public string Name { get; set; }
  public string Description { get; set; }
  public string ImgUrl { get; set; }
  public string Views { get; set; }
  public string CreatorId { get; set; }
}

public record KeepDTO
{
  public int Id { get; init; }
  public string Name { get; init; }
  public string ImgUrl { get; init; }
  public string CreatorId { get; init; }
  public string CreatorName { get; init; }
  public string CreatorPicture { get; init; }
}