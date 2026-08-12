using System.Linq;
using System.Reflection;
var code = Data.GameObjects.ByName("obj_knight_circle").Events[0][0].Actions[0].CodeId;
Console.WriteLine("Type: " + code.GetType().FullName);
foreach (var p in code.GetType().GetProperties(BindingFlags.Public|BindingFlags.NonPublic|BindingFlags.Instance))
    Console.WriteLine(p.Name + " : " + p.PropertyType.ToString());
