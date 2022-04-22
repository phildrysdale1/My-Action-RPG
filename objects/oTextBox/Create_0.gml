//Load your file.
ChatterboxLoadFromFile("test.yarn"); //or whatever you called yours
// Create Chatterbox
global.chatterbox = ChatterboxCreate("test.yarn"); 

// Initialise Chatterbox by jumping to a node ("Start")
ChatterboxJump(global.chatterbox,"KarenMeet01");
text        = ChatterboxGetContent(global.chatterbox,0);
nodeTitle   = ChatterboxGetCurrent(global.chatterbox);

// setviewport
xx1 = camera_get_view_x(view_camera[0]);
yy1 = camera_get_view_y(view_camera[0]);

// Draw textbox as line in middle of screen to stretch out to edges.
x1 = RESOLUTION_W/2;
y1 = RESOLUTION_H - 70;
x2 = RESOLUTION_W/2;
y2 = RESOLUTION_H;

// Stretch out variables
x1Target = xx1 + 20;
x2Target = xx1 + RESOLUTION_W - 20;
lerpProgress = 0; // tells us how far along we are in the animation process (between 0-1)
textProgress = 0; // Represents number of character in the text box

// reset text reponse selected
responseSelected = 0;

background = 1;
