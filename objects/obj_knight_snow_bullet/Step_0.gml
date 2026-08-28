timer++;
if (y > (cameray() + 480))
{
    instance_destroy();
}

if (x > (camerax() + 640))
{
    instance_destroy();
}

if (timer > 1000)
{
    instance_destroy();
}

_speed += speedincrease;
speedincrease += 0.01;
_speed = min(_speed, 12);
_direction -= speedincrease * 2;
x += cos(degtorad(_direction)) * _speed;
y += sin(degtorad(_direction)) * _speed;
