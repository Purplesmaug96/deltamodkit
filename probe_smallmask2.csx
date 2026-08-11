using System.Linq;
var names = new[]{"spr_dodgeheart_smallmask","spr_dodgeheartmask","spr_dodgeheart","spr_dodgeheart_smaller_2px_mask"};
foreach (var n in names) {
    var sp = Data.Sprites.FirstOrDefault(x => x.Name.Content == n);
    if (sp == null) { System.Console.WriteLine(n + " : NOT FOUND"); continue; }
    System.Console.WriteLine("===== " + n + " =====");
    System.Console.WriteLine("  width=" + sp.Width + " height=" + sp.Height + " SepMasks=" + sp.SepMasks + " BBoxMode=" + sp.BBoxMode);
    System.Console.WriteLine("  marginL=" + sp.MarginLeft + " marginR=" + sp.MarginRight + " marginT=" + sp.MarginTop + " marginB=" + sp.MarginBottom);
    System.Console.WriteLine("  xo=" + sp.OriginX + " yo=" + sp.OriginY + " Transparent=" + sp.Transparent + " Smooth=" + sp.Smooth + " Preload=" + sp.Preload);
    System.Console.WriteLine("  frames=" + sp.Textures.Count + " masks=" + sp.CollisionMasks.Count);
    for (int i = 0; i < sp.CollisionMasks.Count; i++) {
        if (sp.CollisionMasks[i]?.Data is not null) {
            int tot = sp.CollisionMasks[i].Data.Count();
            int ne = sp.CollisionMasks[i].Data.Count(b => b != 0);
            System.Console.WriteLine("  mask[" + i + "] total=" + tot + " nonempty=" + ne + " fill=" + (tot==0?0:ne*100/tot) + "%");
        }
    }
}