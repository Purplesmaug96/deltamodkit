using System.Linq;
using System.Reflection;
var obj = Data.GameObjects.ByName("obj_knight_rotating_slash");
foreach (var ev in obj.Events)
{
    foreach (var act in ev.First().Actions)
    {
        var items = act.GetType().GetProperties().Select(p => {
            object v = null; try { v = p.GetValue(act); } catch {}
            return p.Name + "=" + (v?.ToString() ?? "null");
        });
        Console.WriteLine("ACTION fields: " + string.Join(" | ", items));
    }
}
