using System.Linq;
var names = new[]{"obj_sword_tunnel_sword","obj_sword_tunnel_hitbox","obj_sword_tunnel_slash"};
foreach (var n in names) {
    var o = Data.GameObjects.FirstOrDefault(x => x.Name.Content == n);
    if (o == null) { System.Console.WriteLine(n + " : NOT FOUND"); continue; }
    string parent = "NONE";
    var pid = o.ParentId;
    if (pid != null) {
        var pr = pid.GetType().GetProperty("Name");
        if (pr != null) { var nm = pr.GetValue(pid); if (nm != null) { var c = nm.GetType().GetProperty("Content"); if (c != null) parent = c.GetValue(nm)?.ToString() ?? "?"; } }
    }
    string sprite = "null", mask = "null";
    try { sprite = o.Sprite?.Name?.Content ?? "null"; } catch {}
    System.Console.WriteLine(n + " : parent=" + parent + " sprite=" + sprite);
    foreach (var evgroup in o.Events) {
        foreach (var e in evgroup) {
            foreach (var a in e.Actions) {
                if (a.CodeId != null && a.CodeId.Name != null)
                    System.Console.WriteLine("    event: " + a.CodeId.Name.Content);
            }
        }
    }
}