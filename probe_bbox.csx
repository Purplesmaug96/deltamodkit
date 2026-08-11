using System.Linq;
var names = new[]{"spr_dodgeheart_smallmask","spr_knight_diamondbullet_l","spr_roaringknight_tooth","spr_knight_bullet_star_mask","spr_dodgeheartmask"};
foreach (var n in names) {
    var sp = Data.Sprites.FirstOrDefault(x => x.Name.Content == n);
    if (sp == null) { Console.WriteLine(n + " NOT FOUND"); continue; }
    Console.WriteLine(n + " w=" + sp.Width + " h=" + sp.Height + " mL=" + sp.MarginLeft + " mR=" + sp.MarginRight + " mT=" + sp.MarginTop + " mB=" + sp.MarginBottom + " bboxMode=" + sp.BBoxMode);
}
