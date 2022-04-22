/// @description Set up camera
// select camera for viewport 0
cam = view_camera[0];

// set instance camera will follow
follow = oPlayer;

// center camera on whatever we are following

viewWidthHalf = RESOLUTION_W * 0.5;
viewHeightHalf = RESOLUTION_H * 0.5;
// where our camera is heading towards
xTo = xstart;
yTo = ystart;

// screenshake variables
shakeLength = 0; // how long the shake will be
shakeMagnitude = 0; // how strong the shake will be
shakeRemain = 0; // how much time remaining in the shake





