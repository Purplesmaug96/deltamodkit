using System.Linq;
var names = new[]{"spr_knight_diamondbullet_l","spr_knight_diamondbullet","spr_diamondbullet"};
foreach (var n in names) {
    var sp = Data.Sprites.FirstOrDefault(x => x.Name.Content == n);
    if (sp == null) { System.Console.WriteLine(n + " : NOT FOUND"); continue; }
    System.Console.WriteLine(n + " : width=" + sp.Width + " height=" + sp.Height + " SepMasks=" + sp.SepMasks + " BBoxMode=" + sp.BBoxMode + " margins=" + sp.MarginLeft + "," + sp.MarginRight + "," + sp.MarginTop + "," + sp.MarginBottom + " xo=" + sp.OriginX + " yo=" + sp.OriginY + " frames=" + (sp.Textures?.Count ?? 0));
}