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

    float x_adjuster;
    x_adjuster = 0.003;

    float y_adjuster;
    y_adjuster = 0.002;

    float line_width;
    line_width = 0.005;
    float line_long;
    line_long = 0.0275;
    
    float line_dis;
    line_dis = (line_width /1.5) + (vertexColor.r*0.5);

    if((nCoord.y > -(line_width / 2.0) - y_adjuster && nCoord.y < (line_width / 2.0) - y_adjuster)){
      fragColor = vec4(vec3(0.0), 0.0);
      if(nCoord.x > line_dis * 1.0 - x_adjuster  && nCoord.x < (line_dis + line_long) - x_adjuster ){
        fragColor = vec4(vec3(1.0), 1.0);
      }else if(nCoord.x < -line_dis - x_adjuster  && nCoord.x > -(line_dis + line_long) - x_adjuster ){
        fragColor = vec4(vec3(1.0), 1.0);
      }
    }else if(nCoord.x > -(line_width / 2.0) - x_adjuster && nCoord.x < (line_width / 2.0) - x_adjuster){
      fragColor = vec4(vec3(0.0), 0.0);
      //if(nCoord.y> line_dis - y_adjuster && nCoord.y < line_dis + line_long - y_adjuster){
      //  fragColor = vec4(vec3(1.0), 1.0);
      if(nCoord.y < -line_dis - y_adjuster && nCoord.y > -(line_dis + line_long) - y_adjuster){
        fragColor = vec4(vec3(1.0), 1.0);
      }
    }else{
      fragColor = vec4(vec3(0.0), 0.0 );
    }
    if(nCoord.x > -(line_width/2.0) -x_adjuster&& nCoord.x < (line_width/2.0)-x_adjuster){
      if(nCoord.y > -(line_width/2.0)- y_adjuster && nCoord.y < (line_width/2.0) - y_adjuster){
         fragColor = vec4(vec3(1.0), 1.0 );
      }
    }
}