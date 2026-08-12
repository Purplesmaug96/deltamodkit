using System.Linq;
var objnames = new[]{"obj_afterimage_screen","obj_knight_circle","obj_knight_swordfall","obj_knight_tunnel_slasher_2_revised","obj_knight_warp","obj_knight_weird_bottom_manager","obj_particle_generic","obj_roaringknight_quickslash_attack","obj_roaringknight_slash"};
var sb = new System.Collections.Generic.List<string>();
foreach (var n in objnames)
{
    var obj = Data.GameObjects.ByName(n);
    if (obj == null) continue;
    for (int et = 0; et < obj.Events.Count; et++)
        foreach (var ev in obj.Events[et])
            foreach (var act in ev.Actions)
                sb.Add(act.CodeId?.Name?.Content);
}
Console.WriteLine(string.Join(" ", sb));
