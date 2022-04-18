/// @desc
// Draw textbox as line in middle of screen to tretch out to edges.
x1 = RESOLUTION_W/2;
y1 = RESOLUTION_H - 70;
x2 = RESOLUTION_W/2;
y2 = RESOLUTION_H;
// Stretch out variables
x1Target = 0;
x2Target = RESOLUTION_W;

lerpProgress = 0; // tells us how far along we are in the animation process (between 0-1)
textProgress = 0; // Represents number of character in the text box

// reset text reponse selected
responseSelected = 0;

