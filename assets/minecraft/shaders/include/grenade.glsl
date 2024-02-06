
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
    x_adjuster = -0.003;

    //応急処置用(y)
    float y_adjuster;
    y_adjuster = 0.00;

    //線の太さ
    float line_wide;
    line_wide = 0.0058;
    
    //短い線の長さ
    float short_line;
    short_line = 0.015;
    //中くらいの線の長さ
    float medium_line;
    medium_line = 0.03;//これくらいかな？
    //長い線の長さ
    float long_line;
    long_line = 0.045;
    //下のチョン？
    float tyon_line;
    tyon_line = 0.1;
    //横の線の離れている距離
    float beside_leave_distance;
    beside_leave_distance = 0.016;
    //縦の線の離れている距離
    float vertical_leave_distance;
    vertical_leave_distance = 0.03;
   
    fragColor = vec4(0.0);
    
    // 右側
    if(beside_leave_distance + x_adjuster< nCoord.x &&
        nCoord.x < beside_leave_distance + line_wide + x_adjuster){
        fragColor = vec4(vec3(0.0),0.0);
        if(vertical_leave_distance + y_adjuster - line_wide - line_wide< nCoord.y &&
         nCoord.y < vertical_leave_distance + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        if(0.0 + y_adjuster - line_wide - line_wide < nCoord.y &&
            nCoord.y < line_wide + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        if(-line_wide - vertical_leave_distance + y_adjuster - line_wide - line_wide < nCoord.y &&
         nCoord.y < (-vertical_leave_distance + y_adjuster)){
            fragColor = vec4(vec3(1.0),1.0);
        } 
    }
    //左側
    if( - beside_leave_distance + x_adjuster> nCoord.x &&
        nCoord.x > -(beside_leave_distance + line_wide - 0.001) + x_adjuster){
        fragColor = vec4(vec3(0.0),0.0);
        if(vertical_leave_distance + y_adjuster - line_wide- line_wide < nCoord.y &&
         nCoord.y < vertical_leave_distance + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        if(0.0 + y_adjuster - line_wide- line_wide < nCoord.y &&
            nCoord.y < line_wide + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        if(-line_wide - vertical_leave_distance + y_adjuster - line_wide - line_wide < nCoord.y &&
         nCoord.y < (-vertical_leave_distance + y_adjuster)){
            fragColor = vec4(vec3(1.0),1.0);
        }    
    }

    if(vertical_leave_distance + y_adjuster < nCoord.y &&
     nCoord.y < line_wide + vertical_leave_distance + y_adjuster){
        fragColor = vec4(vec3(0.0), 0.0);
        // 上の右側
        if(beside_leave_distance + x_adjuster < nCoord.x &&
         nCoord.x < beside_leave_distance + long_line + x_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
            if(vertical_leave_distance + y_adjuster - line_wide< nCoord.y &&
         nCoord.y < vertical_leave_distance + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        }
        //上の左側
        if( - beside_leave_distance + x_adjuster > nCoord.x &&
         nCoord.x > -(beside_leave_distance + long_line) + x_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
            if(vertical_leave_distance + y_adjuster - line_wide< nCoord.y &&
         nCoord.y < vertical_leave_distance + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        }
    
    }else if(0.0 + y_adjuster < nCoord.y &&
     nCoord.y < line_wide + y_adjuster){
        fragColor = vec4(vec3(0.0), 0.0);
        // 真ん中の右側
        if(beside_leave_distance + x_adjuster< nCoord.x &&
         nCoord.x < beside_leave_distance + medium_line+ x_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
            if(0.0 - line_wide< nCoord.y &&
         nCoord.y < vertical_leave_distance + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        }
        // 真ん中の左側
        if( - beside_leave_distance + x_adjuster> nCoord.x &&
         nCoord.x > -(beside_leave_distance + medium_line)+ x_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
            if(0.0 - line_wide< nCoord.y &&
         nCoord.y < vertical_leave_distance + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        }
    }else if(-line_wide - vertical_leave_distance + 0.001 < nCoord.y &&
     nCoord.y < (-vertical_leave_distance + y_adjuster+ 0.001)){
        fragColor = vec4(vec3(0.0), 0.0);
        // 下の右側
        if(beside_leave_distance+ x_adjuster < nCoord.x &&
         nCoord.x < beside_leave_distance + short_line+ x_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
            if(vertical_leave_distance + y_adjuster - line_wide< nCoord.y &&
         nCoord.y < vertical_leave_distance + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        }
        //下の左側
        //落ちます
        if( - beside_leave_distance+ x_adjuster > nCoord.x &&
         nCoord.x > -(beside_leave_distance + short_line)+ x_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
            if(vertical_leave_distance + y_adjuster - line_wide< nCoord.y &&
         nCoord.y < vertical_leave_distance + y_adjuster){
            fragColor = vec4(vec3(1.0),1.0);
        }
        }
    }

   if(1.0 - (line_wide/2.0) + x_adjuster < nCoord.x && nCoord.x < 1.0 + (line_wide/2.0) + x_adjuster){
      if(1.0 - (line_wide/2.0) + y_adjuster < nCoord.y && nCoord.y < 1.0 + (line_wide/2.0) + y_adjuster){
         fragColor = vec4(vec3(1.0),1.0);
      }
   }
}