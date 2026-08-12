using System.Linq;
using System.Reflection;
var obj = Data.GameObjects.ByName("obj_knight_circle");
foreach (var evgrp in obj.Events)
{
    foreach (var ev in evgrp)
    {
        var items = ev.GetType().GetProperties().Select(p => {
            object v = null; try { v = p.GetValue(ev); } catch {}
            return p.Name + "=" + (v?.ToString() ?? "null");
        });
        Console.WriteLine("EVENT: " + string.Join(" | ", items));
    }
}
