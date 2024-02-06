#ifndef _fsh
const vec4 vertexColor = vec4(vec3(255,0,0)/255.0 ,1.0);
#endif


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   vec2 nCoord;
   //座標正規化(0~1)
   nCoord = fragCoord/iResolution.xy;

   //座標正規化(-1~1)
   nCoord = fragCoord * 2.0 - iResolution.xy;
   nCoord /= min( iResolution.x, iResolution.y );

   //応急処置用(x)
   float x_adjuster;
   x_adjuster = 0.0025;

   //応急処置用(y)
   float y_adjuster;
   y_adjuster = 0.0006;

   //高さ
   float y_high;
   y_high = 0.003;

   //横
   float x_high;
   x_high = 0.003;

   //線の長さ
   float line_long;
   line_long = 0.0058;
//左線
if( -(line_long) * 5.0 + -(x_adjuster) - x_high < nCoord.x && nCoord.x < -(line_long) * 4.0 + -(x_adjuster) - x_high ){
    fragColor = vec4(vec3(1.0),1.0);
    if( line_long * 1.3 < nCoord.y ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( -(line_long) * 1.7 > nCoord.y ){
        fragColor = vec4(vec3(0.0),0.0);
    }
}
//右線
if( line_long * 5.2 + x_adjuster - x_high - 0.002 > nCoord.x && nCoord.x > line_long * 4.0 + x_adjuster -x_high -0.002 ){
    fragColor = vec4(vec3(1.0),1.0);
    if( line_long * 1.3 < nCoord.y ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( -(line_long) * 1.7 > nCoord.y ){
        fragColor = vec4(vec3(0.0),0.0);
    }
}
//下線
if( -(line_long) * 5.1 + -(y_adjuster) + -(y_high) < nCoord.y && nCoord.y < -(line_long) * 4.0 + -(y_adjuster) + -(y_high) ){
    fragColor = vec4(vec3(1.0),1.0);
    if( line_long * 1.1 < nCoord.x ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( -(line_long) * 1.8 > nCoord.x ){
        fragColor = vec4(vec3(0.0),0.0);
    }
}
//上線
if( line_long * 5.4 + y_adjuster + -(y_high)> nCoord.y && nCoord.y > line_long * 4.0 + y_adjuster + -(y_high)){
    fragColor = vec4(vec3(1.0),1.0);
    if( line_long * 1.1 < nCoord.x ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( -(line_long) * 1.8 > nCoord.x ){
        fragColor = vec4(vec3(0.0),0.0);
    }
}
//左縦線
if( -(line_long) * 4.0 + -(x_adjuster) - x_high < nCoord.x && nCoord.x < -(line_long) * 3.0 + -(x_adjuster) -x_high ){
    fragColor = vec4(vec3(1.0),1.0);
    if( line_long * 3.5 < nCoord.y ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( -(line_long) * 3.7 > nCoord.y ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( line_long * 1.3 > nCoord.y&& nCoord.y > -(line_long) * 1.7){
        fragColor = vec4(vec3(0.0),0.0);
    }
}
//右縦線
if( line_long * 4.0 + x_adjuster - x_high > nCoord.x && nCoord.x > line_long * 3.0 + x_adjuster -x_high ){
    fragColor = vec4(vec3(1.0),1.0);
    if( line_long * 3.5 < nCoord.y ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( -(line_long) * 3.7 > nCoord.y ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( line_long * 1.3 > nCoord.y&& nCoord.y > -(line_long) * 1.7){
        fragColor = vec4(vec3(0.0),0.0);
    }
}
//下横線
if( -(line_long) * 4.0 + -(y_adjuster) + -(y_high) < nCoord.y && nCoord.y < -(line_long) * 3.0 + -(y_adjuster) + -(y_high) ){
    fragColor = vec4(vec3(1.0),1.0);
    if( line_long * 3.0 < nCoord.x ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( -(line_long) * 3.8 > nCoord.x ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( line_long * 0.9 > nCoord. x&& nCoord.x > -(line_long) * 2.0){
        fragColor = vec4(vec3(0.0),0.0);
    }
}
//上横線
if( line_long * 4.5 + y_adjuster + -(y_high) > nCoord.y && nCoord.y > line_long * 3.5 + y_adjuster + -(y_high) ){
    fragColor = vec4(vec3(1.0),1.0);
    if( line_long * 3.0 < nCoord.x ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( -(line_long) * 3.8 > nCoord.x ){
        fragColor = vec4(vec3(0.0),0.0);
    }
    if( line_long * 0.9 > nCoord. x&& nCoord.x > -(line_long) * 2.0 ){
        fragColor = vec4(vec3(0.0),0.0);
    }
}
}