using System.Linq;
var names = new[]{"spr_dodgeheart_smallmask","spr_dodgeheart","spr_dodgeheartmask","spr_dodgeheart_smaller_2px","spr_dodgeheart_smaller_2px_mask"};
foreach (var n in names) {
    var sp = Data.Sprites.FirstOrDefault(x => x.Name.Content == n);
    if (sp == null) { System.Console.WriteLine(n + " : NOT FOUND"); continue; }
    System.Console.WriteLine(n + " :");
    System.Console.WriteLine("  width=" + sp.Width + " height=" + sp.Height + " SepMasks=" + sp.SepMasks + " BBoxMode=" + sp.BBoxMode + " margins=" + sp.MarginLeft + "," + sp.MarginRight + "," + sp.MarginTop + "," + sp.MarginBottom + " xo=" + sp.OriginX + " yo=" + sp.OriginY);
    System.Console.WriteLine("  SSpriteType=" + sp.SSpriteType + " SVersion=" + sp.SVersion + " Transparent=" + sp.Transparent + " Smooth=" + sp.Smooth + " Preload=" + sp.Preload);
    System.Console.WriteLine("  textures=" + (sp.Textures?.Count ?? 0));
    if (sp.Textures != null) {
        foreach (var t in sp.Textures) {
            System.Console.WriteLine("    tex page=" + t.Texture?.Name?.Content + " source=" + t.SourceX + "," + t.SourceY + " w=" + t.SourceWidth + " h=" + t.SourceHeight);
        }
    }
    if (sp.CollisionMasks != null) {
        int mi = 0;
        foreach (var m in sp.CollisionMasks) {
            if (m.Data != null) {
                var bytes = m.Data;
                int total = bytes.Count();
                int nonempty = bytes.Count(b => b != 0);
                System.Console.WriteLine("  mask[" + mi + "] bytes=" + total + " nonempty=" + nonempty + " fill=" + (total==0?0:nonempty*100/total) + "%");
            }
            mi++;
        }
    }
}