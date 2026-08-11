using System.Linq;
using System.Reflection;
var obj = Data.GameObjects.ByName("obj_sword_tunnel_sword");
var sb = new System.Text.StringBuilder();
foreach (var p in obj.GetType().GetProperties()) {
    object v = null;
    try { v = p.GetValue(obj); } catch {}
    if (v == null) continue;
    sb.Append(p.Name + "=" + v + " | ");
}
Console.WriteLine(sb.ToString());
