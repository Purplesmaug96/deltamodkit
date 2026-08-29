timer++;

if (timer > 1000)
{
    instance_destroy();
}

image_angle = -_direction;

if (timer < teleframes) exit;

_speed += speedincrease;
speedincrease += 0.1;

i = max_old - 1;
while (i > 0)
{
    old_x[i] = old_x[i - 1];
    old_y[i] = old_y[i - 1];
    i--;
}
old_x[0] = x;
old_y[0] = y;

x += cos(degtorad(_direction)) * _speed;
y += sin(degtorad(_direction)) * _speed;
