using System.Linq;
using System.Reflection;
var names = new[]{"spr_dodgeheart_smallmask","spr_dodgeheartmask","spr_dodgeheart_smaller_2px_mask","spr_knight_bullet_star_mask","spr_knight_diamondbullet_l","spr_roaringknight_tooth"};
foreach (var n in names) {
    var sp = Data.Sprites.FirstOrDefault(x => x.Name.Content == n);
    if (sp == null) { System.Console.WriteLine(n + " : NOT FOUND"); continue; }
    var sb = new System.Text.StringBuilder();
    sb.Append(n);
    foreach (var p in typeof(UndertaleModLib.Models.UndertaleSprite).GetProperties()) {
        object v = null;
        try { v = p.GetValue(sp); } catch {}
        if (v == null) continue;
        sb.Append(" | " + p.Name + "=" + v);
    }
    System.Console.WriteLine(sb.ToString());
}