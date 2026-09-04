function scr_knight_text() {
	if (global.knight_harder) {
		if (phase == 1) {
	        if (phaseturn == 0)
	        {
	            global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You felt something hovering close behind your head...", "obj_knight_enemy_slash_Step_0_gml_496_0");
	        }
	        if (phaseturn == 1)
	        {
	            global.battlemsg[0] = stringsetloc("* You saw swords falling above you...", "obj_knight_enemy_slash_Step_0_gml_521_0");
	        }
	        if (phaseturn == 2)
	        {
	            global.battlemsg[0] = stringsetloc("* Suddenly, the north wind blew fiercely.", "obj_knight_enemy_slash_Step_0_gml_498_0");
	        }
	        if (phaseturn == 3)
	        {
	            global.battlemsg[0] = stringsetloc("* Your vision narrows.", "obj_knight_enemy_slash_Step_0_gml_499_0");
	        }
	        if (phaseturn == 4)
	        {
	            global.battlemsg[0] = stringsetloc("* You feel the shadows cutting deeper.", "obj_knight_enemy_slash_Step_0_gml_500_0");
	        }
	    }
	    if (phase == 2)
	    {
	        if (phaseturn == 0)
	        {
	            global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You felt something hovering close behind your head...", "obj_knight_enemy_slash_Step_0_gml_504_0");
	        }
	        if (phaseturn == 1)
	        {
	            global.battlemsg[0] = stringsetloc("* Suddenly, the enemy rises from below you.", "obj_knight_enemy_slash_Step_0_gml_505_0");
	        }
	        if (phaseturn == 2)
	        {
	            global.battlemsg[0] = stringsetloc("* Coldwater falls from the top of the sky...", "obj_knight_enemy_slash_Step_0_gml_506_0");
	        }
	        if (phaseturn == 3)
	        {
	            global.battlemsg[0] = stringsetloc("* You can't sit still.", "obj_knight_enemy_slash_Step_0_gml_531_0");
	        }
	        if (phaseturn == 4)
	        {
	            global.battlemsg[0] = stringsetloc("* Your vision is dark, darker yet darker.", "obj_knight_enemy_slash_Step_0_gml_508_0");
	        }
	    }
	    if (phase == 3)
	    {
	        if (phaseturn == 0)
	        {
	            global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You felt a migraine coming on...", "obj_knight_enemy_slash_Step_0_gml_514_0");
	        }
	        if (phaseturn == 1)
	        {
	            global.battlemsg[0] = stringsetloc("* You feel trapped.", "obj_knight_enemy_slash_Step_0_gml_515_0");
	        }
	        if (phaseturn == 2)
	        {
	            global.battlemsg[0] = stringsetloc("* Your vision narrows.&* ... The world revolves around you.", "obj_knight_enemy_slash_Step_0_gml_516_0");
	        }
	        if (phaseturn == 3)
	        {
	            global.battlemsg[0] = stringsetloc("* You feel cornered.", "obj_knight_enemy_slash_Step_0_gml_541_0");
	        }
	        if (phaseturn == 4)
	        {
	            global.battlemsg[0] = stringsetloc("* Your heartbeat becomes twisted.", "obj_knight_enemy_slash_Step_0_gml_518_0");
	        }
	    }
	    if (phase == 4 || haveusedroaring == true)
	    {
	        if (phase4turn == 2)
	        {
	            global.battlemsg[0] = stringsetloc("* The Knight's hands glow a strange color...", "obj_knight_enemy_slash_Step_0_gml_319_0");
	        }
	        if (phase4turn > 2)
	        {
	            global.battlemsg[0] = stringsetloc("* The enemy suddenly let down its guard!", "obj_knight_enemy_slash_Step_0_gml_321_0");
	        }
	        if (phase4turn == 3 && progamer == true)
	        {
	            global.battlemsg[0] = stringsetloc("* Kris coughed.&* The enemy slowly tilted its head...", "obj_knight_enemy_slash_Step_0_gml_322_0");
	        }
	    }
	}
	else {
		if (phase == 1) {
	        if (phaseturn == 0)
	        {
	            global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You saw silver stars...", "obj_knight_enemy_slash_Step_0_gml_496_0");
	        }
	        if (phaseturn == 1)
	        {
	            global.battlemsg[0] = stringsetloc("* You felt something hovering close behind your head...", "obj_knight_enemy_slash_Step_0_gml_521_0");
	        }
	        if (phaseturn == 2)
	        {
	            global.battlemsg[0] = stringsetloc("* Suddenly, the north wind blew fiercely.", "obj_knight_enemy_slash_Step_0_gml_498_0");
	        }
	        if (phaseturn == 3)
	        {
	            global.battlemsg[0] = stringsetloc("* Your vision narrows.", "obj_knight_enemy_slash_Step_0_gml_499_0");
	        }
	        if (phaseturn == 4)
	        {
	            global.battlemsg[0] = stringsetloc("* Your chest feels tight.", "obj_knight_enemy_slash_Step_0_gml_500_0");
	        }
	    }
	    if (phase == 2)
	    {
	        if (phaseturn == 0)
	        {
	            global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You saw golden stars...", "obj_knight_enemy_slash_Step_0_gml_504_0");
	        }
	        if (phaseturn == 1)
	        {
	            global.battlemsg[0] = stringsetloc("* Suddenly, the north and east winds blew fiercely.", "obj_knight_enemy_slash_Step_0_gml_505_0");
	        }
	        if (phaseturn == 2)
	        {
	            global.battlemsg[0] = stringsetloc("* Your vision narrows.&* ... Your head is spinning.", "obj_knight_enemy_slash_Step_0_gml_506_0");
	        }
	        if (phaseturn == 3)
	        {
	            global.battlemsg[0] = stringsetloc("* You feel surrounded.", "obj_knight_enemy_slash_Step_0_gml_531_0");
	        }
	        if (phaseturn == 4)
	        {
	            global.battlemsg[0] = stringsetloc("* You felt your chest twisting.", "obj_knight_enemy_slash_Step_0_gml_508_0");
	        }
	    }
	    if (phase == 3)
	    {
	        if (phaseturn == 0)
	        {
	            global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You felt a migraine coming on...", "obj_knight_enemy_slash_Step_0_gml_514_0");
	        }
	        if (phaseturn == 1)
	        {
	            global.battlemsg[0] = stringsetloc("* Suddenly, a tempest.", "obj_knight_enemy_slash_Step_0_gml_515_0");
	        }
	        if (phaseturn == 2)
	        {
	            global.battlemsg[0] = stringsetloc("* Your vision narrows.&* ... The world revolves around you.", "obj_knight_enemy_slash_Step_0_gml_516_0");
	        }
	        if (phaseturn == 3)
	        {
	            global.battlemsg[0] = stringsetloc("* You feel cornered.", "obj_knight_enemy_slash_Step_0_gml_541_0");
	        }
	        if (phaseturn == 4)
	        {
	            global.battlemsg[0] = stringsetloc("* Your heartbeat becomes twisted.", "obj_knight_enemy_slash_Step_0_gml_518_0");
	        }
	    }
	    if (phase == 4 || haveusedroaring == true)
	    {
	        if (phase4turn == 2)
	        {
	            global.battlemsg[0] = stringsetloc("* The Knight's hands glow a strange color...", "obj_knight_enemy_slash_Step_0_gml_319_0");
	        }
	        if (phase4turn > 2)
	        {
	            global.battlemsg[0] = stringsetloc("* The enemy suddenly let down its guard!", "obj_knight_enemy_slash_Step_0_gml_321_0");
	        }
	        if (phase4turn == 3 && progamer == true)
	        {
	            global.battlemsg[0] = stringsetloc("* Kris coughed.&* The enemy slowly tilted its head...", "obj_knight_enemy_slash_Step_0_gml_322_0");
	        }
	    }
	}
}