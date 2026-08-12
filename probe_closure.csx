using System.Linq;
using System.Text.RegularExpressions;
using System.Collections.Generic;

void AddRefs(string code, HashSet<string> set)
{
    if (code == null) return;
    foreach (Match m in Regex.Matches(code, @"\bobj_|\\bobj_([a-zA-Z0-9_]+)|\bspr_([a-zA-Z0-9_]+)|\bscr_([a-zA-Z0-9_]+)|\bsnd_([a-zA-Z0-9_]+)|\baudio_([a-zA-Z0-9_]+)"))
    {
        // handle obj_ etc
    }
    foreach (Match m in Regex.Matches(code, @"(?<![\w.])obj_[a-zA-Z0-9_]+|(?<![\w.])spr_[a-zA-Z0-9_]+|(?<![\w.])scr_[a-zA-Z0-9_]+|(?<![\w.])snd_[a-zA-Z0-9_]+|(?<![\w.])audio_[a-zA-Z0-9_]+"))
        set.Add(m.Value);
}

string GetCode(UndertaleModLib.Models.UndertaleGameObject obj)
{
    var sb = new System.Text.StringBuilder();
    for (int et = 0; et < obj.Events.Count; et++)
        foreach (var ev in obj.Events[et])
            foreach (var act in ev.Actions)
            {
                try { sb.AppendLine(act.CodeId.Disassemble() ?? ""); } catch {}
            }
    return sb.ToString();
}

var roots = new[]{"obj_knight_rotating_slash"};
var pending = new Queue<string>(roots);
var seen = new HashSet<string>();
var objs = new List<string>();
var calls = new HashSet<string>();
while (pending.Count > 0)
{
    var n = pending.Dequeue();
    if (!seen.Add(n)) continue;
    objs.Add(n);
    foreach (var m in Regex.Matches("obj_"+n, @"obj_([a-zA-Z0-9_]+)")) { }
    var o = Data.GameObjects.ByName(n);
    if (o == null) continue;
    // collect code refs from events
    for (int et = 0; et < o.Events.Count; et++)
        foreach (var ev in o.Events[et])
            foreach (var act in ev.Actions)
            {
                string content = null;
                try { content = Program.GetDecompiledText(act.CodeId, new UndertaleModLib.Decompiler.GlobalDecompileContext(Data), null); } catch { }
                AddRefs(content, calls);
            }
}
// which are objects referenced?
var objRefs = calls.Where(c => c.StartsWith("obj_"));
foreach (var c in objRefs) if (!Data.GameObjects.ByName(c) == null) { } 
Console.WriteLine("=== OBJECTS (roots+refs) ===");
foreach (var c in calls.Where(x=>x.StartsWith("obj_")).OrderBy(x=>x)) {
    bool exists = Data.GameObjects.ByName(c) != null;
    Console.WriteLine((exists?"OEXIST ":"OMISS  ") + c);
}
Console.WriteLine("=== SPRITES ===");
foreach (var c in calls.Where(x=>x.StartsWith("spr_")).OrderBy(x=>x)) {
    bool exists = Data.Sprites.ByName(c) != null;
    Console.WriteLine((exists?"SEXIST ":"SMISS  ") + c);
}
Console.WriteLine("=== SCRIPTS ===");
foreach (var c in calls.Where(x=>x.StartsWith("scr_")).OrderBy(x=>x)) {
    bool exists = Data.Scripts.ByName(c) != null;
    Console.WriteLine((exists?"SCEXIST ":"SCMISS ") + c);
}
Console.WriteLine("=== SOUNDS ===");
foreach (var c in calls.Where(x=>x.StartsWith("snd_")||x.StartsWith("audio_")).OrderBy(x=>x)) {
    bool exists = Data.Sounds.ByName(c) != null;
    Console.WriteLine((exists?"XEXIST ":"XMISS  ") + c);
}
Console.WriteLine("=== ALL CALLS (non-asset) ===");
foreach (var c in calls.Where(x=>!x.StartsWith("obj_")&&!x.StartsWith("spr_")&&!x.StartsWith("scr_")&&!x.StartsWith("snd_")).OrderBy(x=>x)) Console.WriteLine("CALL " + c);
