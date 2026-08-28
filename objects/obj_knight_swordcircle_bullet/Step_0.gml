timer++;

if (timer > 1000)
{
    instance_destroy();
}

if (timer < 50) exit;

_speed += speedincrease;
speedincrease += 0.1;
_speed = min(_speed, 16);
x += cos(degtorad(_direction)) * _speed;
y += sin(degtorad(_direction)) * _speed;
