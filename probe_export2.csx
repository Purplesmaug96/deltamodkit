using System.Linq;
using System.IO;
var names = new[]{"spr_dodgeheart_smallmask","spr_knight_diamondbullet_l"};
string outDir = "/hdd/dmk_knight/sprite_export";
foreach (var n in names) {
    var sp = Data.Sprites.FirstOrDefault(x => x.Name.Content == n);
    if (sp == null) { Console.WriteLine(n + " : NOT FOUND"); continue; }
    for (int i = 0; i < sp.Textures.Count; i++) {
        var tex = sp.Textures[i];
        var png = tex.Texture?.Image;
        if (png != null) {
            var path = Path.Combine(outDir, n + "_" + i + "_full.png");
            File.WriteAllBytes(path, png);
            Console.WriteLine("wrote " + path);
        }
    }
}
