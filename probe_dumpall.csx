using System.Linq;
using System.IO;
using UndertaleModCli;
var objnames = new[]{"obj_afterimage_screen","obj_knight_circle","obj_knight_swordfall","obj_knight_tunnel_slasher_2_revised","obj_knight_warp","obj_knight_weird_bottom_manager","obj_particle_generic","obj_roaringknight_quickslash_attack","obj_roaringknight_slash"};
var outdir = "/tmp/rotdump";
Directory.CreateDirectory(outdir);
var ctx = new UndertaleModLib.Decompiler.GlobalDecompileContext(Data);
foreach (var n in objnames)
{
    var obj = Data.GameObjects.ByName(n);
    if (obj == null) continue;
    for (int et = 0; et < obj.Events.Count; et++)
    {
        foreach (var ev in obj.Events[et])
        {
            foreach (var act in ev.Actions)
            {
                var code = act.CodeId;
                string content = "// NO CODE";
                try { content = Program.GetDecompiledText(code, ctx, null); } catch (System.Exception e) { content = "// ERR " + e.Message; }
                string fn = n + "_ev" + et + "_" + ev.EventSubtype + "_" + code?.Name?.Content + ".gml";
                File.WriteAllText(Path.Combine(outdir, fn), content);
                Console.WriteLine(fn + " len=" + content.Length);
            }
        }
    }
}
Console.WriteLine("DONE");
