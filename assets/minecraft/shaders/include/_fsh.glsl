#undef main

in float flag;
in vec2 fragCoord;

in vec3  iResolution;           // viewport resolution (in pixels)
in float iTime;                 // shader playback time (in seconds)
// in float iTimeDelta;            // render time (in seconds)
// in int   iFrame;                // shader playback frame
// in float iChannelTime[4];       // channel playback time (in seconds)
// in vec3  iChannelResolution[4]; // channel resolution (in pixels)
in vec4  iMouse;                // mouse pixel coords. xy: current (if MLB down), zw: click
// in vec4  iDate;                 // (year, month, day, time in seconds)
// in float iSampleRate;           // sound sample rate (i.e., 44100)

#define _fsh

// Add .glsl sources here
#undef mainImage
#define mainImage debug
#moj_import <debug.glsl>
#undef mainImage
#define mainImage auto
#moj_import <auto.glsl>
#undef mainImage
#define mainImage semi
#moj_import <semi.glsl>
#undef mainImage
#define mainImage burst
#moj_import <burst.glsl>
#undef mainImage
#define mainImage buckshot
#moj_import <buckshot.glsl>
#undef mainImage
#define mainImage launcher
#moj_import <launcher.glsl>
#undef mainImage
#define mainImage grenade
#moj_import <grenade.glsl>
#undef mainImage
#define mainImage dot
#moj_import <dot.glsl>

void main() {
    switch(int(flag)){
        default: defaultmain();
        break;
        
        // Add cases here
        case 0: debug
        (fragColor,fragCoord);break;
        case 1: auto
        (fragColor,fragCoord);break;
        case 2: semi
        (fragColor,fragCoord);break;
        case 3: burst
        (fragColor,fragCoord);break;
        case 4: buckshot
        (fragColor,fragCoord);break;
        case 5: launcher
        (fragColor,fragCoord);break;
        case 6: grenade
        (fragColor,fragCoord);break;
        case 7: dot
        (fragColor,fragCoord);break;
    }
}