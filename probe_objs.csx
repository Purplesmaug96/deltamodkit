using System.Linq;
using System.Reflection;
var names = new[]{"obj_afterimage_screen","obj_knight_circle","obj_knight_swordfall","obj_knight_tunnel_slasher_2_revised","obj_knight_warp","obj_knight_weird_bottom_manager","obj_particle_generic","obj_roaringknight_quickslash_attack","obj_roaringknight_slash"};
foreach (var n in names)
{
    var obj = Data.GameObjects.ByName(n);
    Console.WriteLine("### " + n);
    if (obj == null) { Console.WriteLine("NOT FOUND"); continue; }
    Console.WriteLine("PROPS Sprite=" + obj.Sprite?.Name?.Content + " Parent=" + obj.ParentId?.Name?.Content + " Visible=" + obj.Visible + " Solid=" + obj.Solid + " Depth=" + obj.Depth + " Persistent=" + obj.Persistent);
    for (int et = 0; et < obj.Events.Count; et++)
    {
        foreach (var ev in obj.Events[et])
        {
            foreach (var act in ev.Actions)
            {
                var code = act.CodeId;
                Console.WriteLine("EV " + et + ":" + ev.EventSubtype + " code=" + code?.Name?.Content);
            }
        }
    }
}
Console.WriteLine("DONE");
