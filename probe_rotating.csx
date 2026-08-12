using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
var obj = Data.GameObjects.ByName("obj_knight_rotating_slash");
var sb = new System.Text.StringBuilder();
foreach (var p in obj.GetType().GetProperties()) {
    object v = null;
    try { v = p.GetValue(obj); } catch {}
    if (v == null) continue;
    sb.Append(p.Name + "=" + v + " | ");
}
Console.WriteLine(sb.ToString());
var refs = new System.Collections.Generic.HashSet<string>();
foreach (var ev in obj.Events)
    foreach (var ev2 in ev)
    {
        object acode = null;
        foreach (var pr in ev2.GetType().GetProperties()) {
            if (pr.Name == "Code") { try { acode = pr.GetValue(ev2); } catch {} }
        }
        if (acode == null) continue;
        string code = acode.ToString();
        if (code != null)
            foreach (Match m in Regex.Matches(code, @"\bobj_[a-zA-Z0-9_]+|\bspr_[a-zA-Z0-9_]+|\bscr_[a-zA-Z0-9_]+|\bsnd_[a-zA-Z0-9_]+|\baudio_[a-zA-Z0-9_]+|\bglobal\.[a-zA-Z0-9_]+"))
                refs.Add(m.Value);
    }
foreach (var r in refs.OrderBy(x=>x)) Console.WriteLine("REF " + r);
