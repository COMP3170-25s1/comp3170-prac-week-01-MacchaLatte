#version 410

uniform vec3 u_colour;   // Circle colour (r,g,b)
uniform vec3 u_bgColour;       // Background colour (r,g,b)
uniform vec2 u_screenSize;     // Screen dimensions in pixels

layout(location = 0) out vec4 o_colour;  // Output to colour buffer

void main() {
   vec2 p = gl_FragCoord.xy / u_screenSize;  // Normalize to (0,0) - (1,1)
   vec2 circleCenter = vec2(0.4, 0.4);       // New circle center
   float radius = 0.3;                       // New circle radius
   float d = distance(p, circleCenter);      // Distance from new center

   if (d < radius) {
      o_colour = vec4(u_colour, 1);  // Circle color
   }
   else {
      o_colour = vec4(u_bgColour, 1);      // Background color
   }
}
