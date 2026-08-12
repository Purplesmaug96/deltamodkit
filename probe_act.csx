using System.Linq;
using System.Reflection;
var obj = Data.GameObjects.ByName("obj_knight_circle");
foreach (var evgrp in obj.Events)
    foreach (var ev in evgrp)
        foreach (var act in ev.Actions)
        {
            var items = act.GetType().GetProperties().Select(p => {
                object v = null; try { v = p.GetValue(act); } catch {}
                return p.Name + "=" + (v?.ToString()?.Substring(0, System.Math.Min(40, v.ToString().Length)) ?? "null");
            });
            Console.WriteLine("ACTION: " + string.Join(" | ", items));
            break;
        }
