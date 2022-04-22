/// @description Update Camera 

// Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update Object Position - moves towards object 15%
x += (xTo - x) / 15;
y += (yTo - y) / 15;

// Keep camera center inside room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

// Add screenshake effect
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude)); // remove 1/nth from the shake magnitude every frame for the shake length.

// Position camera 
camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);


