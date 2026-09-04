enum DRBulletPattern {
	HomingDiamonds = 0,
	RisingDiamonds = 1,
	SwordThrow = 2, // in vanilla deltarune, this attack has the value of 3, but i dont care
	Stars = 98,
	KnightSplitter = 99,
	KnightSlash = 100,
	KnightLines = 101,
	SwordTunnel = 102,
	XAttacks = 103,
	RotatingSlash = 104,
	CombinationAttack = 105,
	UnderboxAttack = 106,
	RoaringKnight = 107,
	SwordsFalling = 108,
	SwordSlash = 109,
	TrackingSwords = 151,
	DiagonalBullets = 152,
	SwordTunnelNew = 153,
	SwordVortex = 154,
	SnowFall = 155,
	SwordCircle = 156,
	KnightHeartFollower = 157,
	KnightAperture = 158
}

function scr_bullet_pattern(bulletPatternId) {
	// btimer = bullet timer, increases every frame by 1
	// timermax
	// ratio = the ratio by which bullet timer stuff should be multiplied (increases with every enemy)
	
	switch (bulletPatternId) {
		case DRBulletPattern.HomingDiamonds: {
			if btimer < timermax * ratio break;
			
			btimer = 0;
			radius = 140 + random(80);
			var dir = 30 + random(120);
			
			var xx = lengthdir_x(radius, dir);
			var yy = lengthdir_y(radius, dir);
			
			// bullet maker, check out obj_dbullet_maker which you can use as a base
			if i_ex(obj_heart) {
				bm = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_maker);
				scr_bullet_inherit(bm)
			
				if bm.y < cameray() + 40
					bm.y = cameray() + 40;
			}
			break;
		}
		
		case DRBulletPattern.RisingDiamonds: {
			if btimer < 9 * ratio break;
			
			btimer = 0;
			radius = 140 + random(40);
			var yy = radius * side;
			var xx = -100 + random(200);
			
			if choose(0, 1, 2, 3) == 3 xx = -10 + random(20);
			
			if i_ex(obj_heart) {
				d = instance_create(obj_heart.x + 8 + xx, obj_heart.y + 8 + yy, obj_dbullet_vert);
				scr_bullet_inherit(d)
			}
			break;
		}
		
		case DRBulletPattern.SwordThrow: {
			if !made break;
			made = true;
			
			if !i_ex(creatorid) break;
			with (creatorid) image_alpha = 0;
			
			var slasher = instance_create(creatorid.x, creatorid.y, obj_dknight_slasher);
			
			// inherit dbulletcontroller data
			scr_bullet_inherit(slasher);
			
			slasher.timepoints = 2;
			slasher.grazepoints = 6;
			break;
		}
		case DRBulletPattern.RoaringKnight: {
			if (made) break;
		    global.turntimer = 999999;
		    made = true;
		    with (creatorid)
		    {
		        image_alpha = 0;
		    }
		    var knight_roarin2 = instance_create(creatorid.x, creatorid.y, obj_knight_roaring2);
		    knight_roarin2.target = 3;
		    scr_bullet_inherit(knight_roarin2);
			break;
		}
		case DRBulletPattern.Stars: {
			if (init == 1)
			{
				init = 2;
				instance_create(obj_heart.x, obj_heart.y, obj_heart_follower);
				bulletmaker = instance_create(x, y, obj_knight_pointing_cone);
				btimer = 0;
				bulletmaker.difficulty = difficulty;
				endtimer = 120;
				if (difficulty >= 2)
				{
					endtimer += 30;
					global.turntimer += 60;
					endtimer += 60;
				}
				bulletmaker.endtimer = endtimer;
				delay = 0;
				subdelay = 0;
				global.turntimer += 30;
				if (difficulty == 0)
				{
					side = choose(-1, 1);
				}
			}
			else if (init >= 3)
			{
				break;
			}
			if (global.turntimer <= (endtimer + 1))
			{
				init = 3;
			}
			else if ((made != 0 && btimer >= 4) || btimer >= 45)
			{
				if (difficulty == 2)
				{
					side = choose(0, 66, -66);
				}
				d = scr_childbullet(bulletmaker.x + 22, bulletmaker.y + 56, obj_knight_pointing_star);
				d.difficulty = difficulty;
				d.side = side;
				starsound = snd_play_pitch(snd_stardrop, 0.5);
				snd_volume(starsound, 0.5, 0);
				if (made == 0)
				{
					size = random_range(0.5, 1);
					special = random_range(-0.5, 0.5);
				}
				else
				{
					special += 0.5;
					special += (0.5 + (sin(random(1)) * 0.3));
					special %= 1;
					special -= 0.5;
					size += (0.5 + (sin(made) * 0.5));
					size %= 1;
				}
				var _dir = 180 + (special * bulletmaker.angle);
				if (size <= 0.1)
				{
					var _heartdir = point_direction(bulletmaker.x + 22, bulletmaker.y + 56, obj_heart.x + 10, obj_heart.y + 10);
					if (abs(angle_difference(_heartdir, _dir)) < 20)
					{
						if (_dir < _heartdir)
						{
							_dir = (_heartdir - 20) + angle_difference(_heartdir, _dir);
						}
						else
						{
							_dir = _heartdir + 20 + angle_difference(_heartdir, _dir);
						}
						_dir = scr_loop_ext(_dir, 180 - bulletmaker.angle, 180 + bulletmaker.angle);
					}
				}
				d.direction = _dir;
				d.speed = lerp(10, 5, size);
				d.grow_Speed = lerp(0.1, 0.25, size);
				made++;
				btimer = 0;
			}
			break;
		}
		case DRBulletPattern.KnightSplitter: {
			if (!made)
			{
				with (creatorid)
				{
					image_alpha = 0;
				}
				var _slasher = instance_create(creatorid.x, creatorid.y, obj_roaringknight_boxsplitter_attack);
				scr_bullet_inherit(_slasher);
				_slasher.difficulty = difficulty;
				with (_slasher)
				{
					turn_type = "full";
					event_user(0);
				}
				made = true;
			}
			break;
		}
		case DRBulletPattern.KnightSlash: {
			if (made == false)
			{
				made = true;
				with (creatorid)
				{
					image_alpha = 0;
				}
				var roarknight_slasher = instance_create(creatorid.x, creatorid.y, obj_knight_slasher);
				scr_bullet_inherit(roarknight_slasher);
			}
			break;
		}
		case DRBulletPattern.KnightLines: {
			if (!made)
			{
				made = true;
				obj_growtangle.x -= 70;
				obj_heart.x -= 70;
				obj_growtangle.image_xscale = 2.5;
				with (creatorid)
				{
					image_alpha = 0;
				}
				var roarknight_tunnel_slasher = instance_create(creatorid.x, creatorid.y, obj_knight_tunnel_slasher);
				scr_bullet_inherit(roarknight_tunnel_slasher);
			}
			break;
		}
		case DRBulletPattern.SwordTunnel: {
			if (!made)
			{
				global.turntimer = 999999;
				made = true;
				var knight_swordtunnel = instance_create(creatorid.x, creatorid.y, obj_knight_tunnel_slasher_2_revised);
				scr_bullet_inherit(knight_swordtunnel);
				with (knight_swordtunnel)
				{
					event_user(0);
				}
				with (creatorid)
				{
					image_alpha = 0;
				}
			}
			break;
		}
		case DRBulletPattern.XAttacks: {
			if (made == false)
			{
				obj_growtangle.image_xscale = 3.5;
				obj_growtangle.image_yscale = 3.5;
				made = true;
				with (creatorid)
				{
					image_alpha = 0;
				}
				var knight_stream = instance_create(creatorid.x, creatorid.y, obj_knight_stream);
				scr_bullet_inherit(knight_stream);
			}
			break;
		}
		case DRBulletPattern.RotatingSlash: {
			if (made == false)
			{
				global.turntimer = 999999;
				made = true;
				with (creatorid)
				{
					image_alpha = 0;
				}
				var knight_stream = instance_create(creatorid.x, creatorid.y, obj_knight_rotating_slash);
				knight_stream.difficulty = difficulty;
				with (knight_stream)
				{
					event_user(0);
				}
				scr_bullet_inherit(knight_stream);
			}
			break;
		}
		case DRBulletPattern.CombinationAttack: {
			if (!made)
			{
				with (creatorid)
				{
					image_alpha = 0;
				}
				global.turntimer = 999999;
				var knight_combo = instance_create(0, 0, obj_knight_combinations);
				scr_bullet_inherit(knight_combo);
				with (knight_combo)
				{
					event_user(0);
				}
				made = true;
			}
			break;
		}
		case DRBulletPattern.UnderboxAttack: {
			if (!made && i_ex(obj_knight_enemy))
			{
				with (obj_knight_enemy)
				{
					with (instance_create_depth(x, y, depth, obj_knight_warp))
					{
						master = other.id;
						event_user(1);
					}
				}
				obj_growtangle.image_xscale = 2;
				obj_growtangle.image_yscale = 2;
				global.turntimer = 999999;
				made = true;
				with (creatorid)
				{
					image_alpha = 0;
				}
				var knight_weird = instance_create(creatorid.x, creatorid.y, obj_knight_weird_bottom_manager);
				scr_bullet_inherit(knight_weird);
				with (knight_weird)
				{
					event_user(0);
				}
			}
			break;
		}
		case DRBulletPattern.SwordsFalling: {
			if (made == false)
			{
				global.turntimer = 999999;
				made = true;
				with (creatorid)
				{
					image_alpha = 0;
				}
				var knight_swordfall = instance_create(creatorid.x, creatorid.y, obj_knight_swordfall);
				knight_swordfall.target = 3;
				knight_swordfall.difficulty = difficulty;
				scr_bullet_inherit(knight_swordfall);
				with (knight_swordfall)
				{
					turn_type = "full";
					turn_segment = -1;
					next_up = -999;
					turn_segment = 0;
					event_user(0);
				}
			}
			break;
		}
		case DRBulletPattern.SwordSlash: {
			if (!made)
			{
				with (creatorid)
				{
					with (instance_create_depth(x, y, depth, obj_knight_warp))
					{
						master = other.id;
						event_user(1);
					}
				}
				made = true;
				d = instance_create((camerax() + 480 + 80) - 80, cameray() + 160, obj_bullet_knight_crescentGenerator);
				if (difficulty == 1)
				{
					d.type = 3;
				}
			}
			break;
		}
		case DRBulletPattern.TrackingSwords: {
			if (!made)
			{
				var _manager = instance_create(obj_growtangle.x, cameray(), obj_tracking_swords_manager);
				scr_bullet_inherit(_manager);
				_manager.variant = difficulty;
				_manager.damage = damage;
				with (_manager)
				{
					event_user(0);
				}
				made = true;
			}
			break;
		}
		case DRBulletPattern.DiagonalBullets: {
			if (!made)
			{
				var _manager = instance_create(obj_growtangle.x, cameray(), obj_diagonal_bullet_manager);
				scr_bullet_inherit(_manager);
				_manager.difficulty = difficulty;
				made = true;
			}
			break;
		}
		case DRBulletPattern.SwordTunnelNew: {
			if (!made)
			{
				var _manager = instance_create(obj_growtangle.x, cameray(), obj_sword_tunnel_manager);
				scr_bullet_inherit(_manager);
				_manager.difficulty = difficulty;
				_manager.damage = damage;
				with (_manager)
				{
					event_user(0);
				}
				made = true;
			}
			break;
		}
		case DRBulletPattern.SwordVortex: {
			if (!made)
			{
				var _manager = instance_create(obj_growtangle.x, cameray(), obj_sword_vortex_manager);
				scr_bullet_inherit(_manager);
				_manager.variant = difficulty;
				_manager.damage = damage;
				made = true;
			}
			break;
		}
		case DRBulletPattern.SnowFall: {
			if (!made)
			{
				var _manager = instance_create(obj_growtangle.x, cameray(), obj_knight_snow_manager);
				scr_bullet_inherit(_manager);
				_manager.difficulty = difficulty;
				made = true;
			}
			break;
		}
		case DRBulletPattern.SwordCircle: {
			if (!made)
			{
				var _manager = instance_create(obj_growtangle.x, cameray(), obj_knight_swordcircle_manager);
				scr_bullet_inherit(_manager);
				_manager.difficulty = difficulty;
				made = true;
			}
			break;
		}
		case DRBulletPattern.KnightHeartFollower: {
			if (!made)
			{
				var _manager = instance_create(obj_growtangle.x, cameray(), obj_knight_heartfollower_manager);
				scr_bullet_inherit(_manager);
				_manager.difficulty = difficulty;
				made = true;
			}
			break;
		}
		case DRBulletPattern.KnightAperture: {
			if (!made)
			{
				var _manager = instance_create(obj_growtangle.x, cameray(), obj_tracking_swords_aperture_manager);
				scr_bullet_inherit(_manager);
				_manager.variant = difficulty;
				_manager.damage = damage;
				with (_manager)
				{
					event_user(0);
				}
				made = true;
			}
			break;
		}
	}
}