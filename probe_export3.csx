using System.IO;
using System.Threading.Tasks;
using UndertaleModLib.Util;
using UndertaleModLib.Models;
using System.Linq;

var outdir = "/hdd/dmk_knight/sprite_export/padded";
Directory.CreateDirectory(outdir);

var targets = new[]{"spr_knight_diamondbullet_l","spr_dodgeheart_smallmask"};
using (var worker = new TextureWorker())
{
    await Task.Run(() =>
    {
        foreach (var t in targets) {
            var sp = Data.Sprites.FirstOrDefault(x => x.Name.Content == t);
            if (sp == null) { System.Console.WriteLine(t + " : NOT FOUND"); continue; }
            for (int i = 0; i < sp.Textures.Count; i++) {
                if (sp.Textures[i]?.Texture is not null) {
                    worker.ExportAsPNG(sp.Textures[i].Texture, Path.Combine(outdir, t + "_" + i + ".png"), null, true);
                    System.Console.WriteLine("  exported frame " + i);
                }
            }
            for (int i = 0; i < sp.CollisionMasks.Count; i++) {
                if (sp.CollisionMasks[i]?.Data is not null) {
                    var (mw, mh) = sp.CalculateMaskDimensions(Data);
                    TextureWorker.ExportCollisionMaskPNG(sp.CollisionMasks[i], Path.Combine(outdir, t + "_" + i + "_mask.png"), mw, mh);
                    System.Console.WriteLine("  exported mask " + i);
                }
            }
        }
    });
}
System.Console.WriteLine("DONE");
