function scr_damage()
{
	if global.inv > 0 return;
	
    scr_damage_cache();

    if (i_ex(obj_knight_enemy))
    {
        with (obj_knight_enemy)
        {
            progamer = false;
        }
    }

    var __element = 0;
        
    if (variable_instance_exists(id, "element") && is_real(element))
        __element = element;
        
    if (target < 3)
    {
        var skipthis = false;
            
        if (!skipthis)
        {
            if (global.hp[global.char[target]] <= 0)
            {
                scr_randomtarget_old();
                target = mytarget;
                    
                with (global.charinstance[target])
                {
                    image_blend = c_white;
                    darkify = 0;
                }
            }
        }
    }
        
    var __remtarget = -1;
        
    if (target == 4)
    {
        __remtarget = 4;
        scr_randomtarget_old();
        target = mytarget;
        var getList = array_length(global.char);
            
        if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
        {
            scr_randomtarget_old();
            target = mytarget;
        }
            
        if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
        {
            scr_randomtarget_old();
            target = mytarget;
        }
            
        if (target == 0 && (global.hp[global.char[target]] / global.maxhp[global.char[target]]) < 0.35)
        {
            scr_randomtarget_old();
            target = mytarget;
        }
            
        with (global.charinstance[target])
        {
            image_blend = c_white;
            darkify = 0;
        }
    }
        
    chartarget = 3;

    var truedamage = 0;
    if (i_ex(obj_knight_roaring2))
    {
        truedamage = 1;
    }

    if (i_ex(obj_knight_enemy) && truedamage == 0)
    {
        if (obj_knight_enemy.aoedamage == false)
        {
            if (target == 0)
            {
                if (global.hp[1] > 0 && global.hp[2] > 0)
                {
                    target = choose(1, 2);
                }
                else if (global.hp[1] > 0)
                {
                    target = 1;
                }
                else if (global.hp[2] > 0)
                {
                    target = 2;
                }
            }
            if (obj_knight_enemy.myattackchoice != 13)
            {
                if (global.chararmor1[1] == 23 || global.chararmor2[1] == 23 || global.chararmor1[2] == 23 || global.chararmor2[2] == 23 || global.chararmor1[3] == 23 || global.chararmor2[3] == 23)
                {
                    obj_knight_enemy.damagecounter++;
                    if (obj_knight_enemy.damagecounter < 3)
                    {
                        if (global.hp[1] > 0 && (global.chararmor1[1] == 23 || global.chararmor2[1] == 23))
                        {
                            target = 0;
                        }
                        if (global.hp[2] > 0 && (global.chararmor1[2] == 23 || global.chararmor2[2] == 23))
                        {
                            target = 1;
                        }
                        if (global.hp[3] > 0 && (global.chararmor1[3] == 23 || global.chararmor2[3] == 23))
                        {
                            target = 2;
                        }
                    }
                    else
                    {
                        target = choose(0, 1, 2);
                        repeat (2)
                        {
                            if (global.hp[1] < 1 && target == 0)
                            {
                                target++;
                            }
                            if (global.hp[2] < 1 && target == 1)
                            {
                                target++;
                            }
                            if (global.hp[3] < 1 && target == 2)
                            {
                                target++;
                            }
                            if (target > 2)
                            {
                                target = 0;
                            }
                        }
                        if ((target == 0 && global.chararmor1[1] == 23) || global.chararmor2[1] == 23)
                        {
                        }
                        else if ((target == 1 && global.chararmor1[2] == 23) || global.chararmor2[2] == 23)
                        {
                        }
                        else if ((target == 2 && global.chararmor1[3] == 23) || global.chararmor2[3] == 23)
                        {
                        }
                        else
                        {
                            obj_knight_enemy.damagecounter = 0;
                        }
                    }
                }
            }
        }
    }

    tdamage = damage;
    var oldcalculation = 0;
    var shadowmantlereduction = false;
        
    if (target < 3)
    {
        if (truedamage == 1)
        {
            // knight final attack: true damage bypasses defense
        }
        else if (oldcalculation)
            tdamage = ceil(tdamage - (global.battledf[target] * 3));
        else
            tdamage = scr_damage_calculation(tdamage, target);

        chartarget = global.char[target];

        if (i_ex(obj_knight_enemy) && truedamage == 0)
        {
            if ((global.chararmor1[1] == 23 || global.chararmor2[1] == 23) && target == 0)
            {
                tdamage = round(tdamage * 0.33);
                shadowmantlereduction = true;
            }
            if ((global.chararmor1[2] == 23 || global.chararmor2[2] == 23) && target == 1)
            {
                tdamage = round(tdamage * 0.33);
                shadowmantlereduction = true;
            }
            if ((global.chararmor1[3] == 23 || global.chararmor2[3] == 23) && target == 2)
            {
                tdamage = round(tdamage * 0.33);
                shadowmantlereduction = true;
            }
        }

        if (truedamage == 1)
        {
            // true damage: skip defend and element reductions
        }
        else
        {
            if (global.charaction[target] == 10) // DEFEND
                tdamage = ceil((2 * tdamage) / 3);

            if (shadowmantlereduction == false)
                tdamage = ceil(tdamage * scr_element_damage_reduction(__element, global.char[target]));
        }
        show_debug_message("The element is: " + string(__element));

        if (tdamage < 1)
            tdamage = 1;
    }
        
    if (!instance_exists(obj_shake))
        instance_create(0, 0, obj_shake);
        
    with (global.charinstance[target])
    {
        hurt = 1;
        hurttimer = 0;
    }
        
    hpdiff = tdamage;
        
    with (obj_dmgwriter)
    {
        if (delaytimer >= 1)
            killactive = 1;
    }
        
    doomtype = -1;
        
    with (obj_heart)
        dmgnoise = 1;
        
    if (target < 3)
    {
        if (global.hp[chartarget] <= 0)
        {
            doomtype = 4;
            global.hp[chartarget] -= round(tdamage / 4);
            hpdiff = round(tdamage / 4);
        }
        else
        {
            if (global.chapter == 3 && i_ex(obj_knight_enemy) && obj_knight_enemy.myattackchoice == 2 && (obj_knight_enemy.difficulty == 1 || obj_knight_enemy.difficulty == 3))
            {
                tdamage = round(tdamage * 0.66);
                hpdiff = tdamage;
            }

            global.hp[chartarget] -= tdamage;

            if (global.hp[chartarget] <= 0)
            {
                if (i_ex(obj_knight_enemy))
                {
                    if (target == 0)
                    {
                        hpdiff = abs(global.hp[chartarget] - (global.maxhp[chartarget] / 2));
                        doomtype = 4;
                        global.hp[chartarget] = round(-global.maxhp[chartarget] / 2);
                        scr_dead(target);
                    }
                    else
                    {
                        doomtype = 12;
                        hpdiff = round(global.hp[chartarget] + 999);
                        global.hp[chartarget] = -999;
                        scr_dead(target);
                    }
                }
                else
                {
                    hpdiff = abs(global.hp[chartarget] - (global.maxhp[chartarget] / 2));
                    doomtype = 4;
                    global.hp[chartarget] = round(-global.maxhp[chartarget] / 2);
                    scr_dead(target);
                }
            }
        }
            
        var __targx = -1;
        var __targy = -1;
            
        if (__targx == -1)
        {
            __targx = global.charinstance[target].x;
            __targy = (global.charinstance[target].y + global.charinstance[target].myheight) - 24;
        }
            
        dmgwriter = instance_create(__targx, __targy, obj_dmgwriter);
        dmgwriter.damage = hpdiff;
        dmgwriter.type = doomtype;
    }
        
    if (target == 3)
    {
        for (hpi = 0; hpi < 3; hpi += 1)
        {
            chartarget = global.char[hpi];
                
            if (global.hp[chartarget] >= 0)
            {
                if (oldcalculation)
                    tdamage = ceil(tdamage - (global.battledf[hpi] * 3));
                else
                    tdamage = scr_damage_calculation(tdamage, hpi);
                    
                tdamage = ceil(tdamage * scr_element_damage_reduction(__element, chartarget));
                    
                if (global.charaction[hpi] == 10)
                    global.hp[chartarget] -= ceil((3 * tdamage) / 4);
                else
                    global.hp[chartarget] -= tdamage;
                    
                if (global.hp[chartarget] <= 0)
                    global.hp[chartarget] = round(-global.maxhp[0] / 2);
            }
        }
    }
        
    if (global.chapter == 3)
        global.inv = global.invc * 30;
    else
        global.inv = global.invc * 40;

    scr_damage_check();
    gameover = true;

	for (var i = 0; i < array_length(global.char); i++) {
		if global.char[i] != DRCharacter.None && global.hp[global.char[i]] > 0 {
			gameover = false;
			break;
		}
	}

    if (i_ex(obj_knight_enemy))
        gameover = false;

    if gameover
        scr_gameover();
        
    if (__remtarget != -1)
        target = __remtarget;
}

function scr_damage_cache()
{
    global.damage_cache = [];
    
    for (var i = 0; i < 3; i++)
        global.damage_cache[array_length(global.damage_cache)] = global.hp[global.char[i]];
}

function scr_damage_check()
{
    if (!variable_global_exists("damage_cache"))
        global.damage_cache = [];
    
    var took_damage = false;
    
    for (var i = 0; i < array_length(global.damage_cache); i++)
    {
        var hp_cache = global.damage_cache[i];
        
        if (global.hp[global.char[i]] < hp_cache)
        {
            took_damage = true;
            break;
        }
    }
}

function scr_party_hpaverage()
{
    var _totalhp = 0;
    var _totalmaxhp = 0;
    var _members = 0;
    
    for (var _hpi = 0; _hpi < array_length(global.char); _hpi++)
    {
        if (global.char[_hpi] > 0)
        {
            _members++;
            _totalhp += global.hp[global.char[_hpi]];
            _totalmaxhp += global.maxhp[global.char[_hpi]];
        }
    }
    
    if (_totalhp > 0)
        return floor(_totalhp / _totalmaxhp);
    else
        return 0;
}

function scr_damage_calculation(arg0, arg1)
{
    var _tdamage = arg0;
    var _tdef = global.battledf[arg1];
    var _tmaxhp = global.maxhp[global.char[arg1]];
    var _finaldamage = 1;
    var _hpthresholda = _tmaxhp / 5;
    var _hpthresholdb = _tmaxhp / 8;
    
    for (var _di = 0; _di < _tdef; _di++)
    {
        if (_tdamage > _hpthresholda)
            _tdamage -= 3;
        else if (_tdamage > _hpthresholdb)
            _tdamage -= 2;
        else
            _tdamage -= 1;
    }
    
    return max(_tdamage, _finaldamage);
}

function scr_element_damage_reduction(arg0, arg1)
{
    var ___element = arg0;
    var ___char = arg1;
    var ___reduction = 1;
    
    if (___element != 0)
    {
        for (var ___itemi = 0; ___itemi < 2; ___itemi++)
        {
            if (global.itemelement[___char][___itemi + 1] != 0)
            {
                if (global.itemelement[___char][___itemi + 1] == ___element)
                    ___reduction -= global.itemelementamount[___char][___itemi + 1];
                
                if (global.itemelement[___char][___itemi + 1] == 9)
                {
                    if (___element == 2 || ___element == 8)
                        ___reduction -= global.itemelementamount[___char][___itemi + 1];
                }
                
                if (global.itemelement[___char][___itemi + 1] == 10)
                    ___reduction -= global.itemelementamount[___char][___itemi + 1];
            }
        }
    }
    
    if (___reduction < 0.25)
        ___reduction = 0.25;
    
    return ___reduction;
}

function scr_damage_all(arg0 = 1)
{
    if (global.inv < 0)
    {
        remdamage = damage;
        _temptarget = target;
        
        for (ti = 0; ti < array_length(global.char); ti += 1)
        {
            global.inv = -1;
            damage = remdamage;
            var _inverse_proportion = 1 - arg0;
            var _damscale = global.hp[global.char[ti]] / global.maxhp[global.char[ti]];
            var _dammod = (_damscale * _inverse_proportion) + (1 * arg0);
            damage *= _dammod;
            target = ti;
            
            if (global.hp[global.char[ti]] > 0 && global.char[ti] != DRCharacter.None)
                scr_damage();
        }
        
        global.inv = global.invc * 40;
        target = _temptarget;
    }
}

function scr_dead(arg0) {
	global.charmove[arg0] = 0;
	global.charcantarget[arg0] = 0;
	global.chardead[arg0] = 1;
	global.charaction[arg0] = 0;
	global.charspecial[arg0] = 0;
}
