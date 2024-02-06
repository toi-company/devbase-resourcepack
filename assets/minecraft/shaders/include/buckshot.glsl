#ifndef _fsh
const vec4 vertexColor = vec4(vec3(0,5,100)/255.0 ,1.0);
#endif

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;

    uv = fragCoord * 2.0 - iResolution.xy;
    uv /= min( iResolution.x, iResolution.y );


    float dis = 0.08 + vertexColor.r * 0.2;
    float central = 0.0;

    float width = 0.055 * 0.1 * 1.1 * 0.95;
    float line_long =  0.5 * 0.1;
    float under_half_pos = central-(line_long/2.0);
    float over_half_pos = central+(line_long/2.0);
    float x_adjust = -0.0025;
    float y_adjust = -0.0025;
    fragColor = vec4(0.0);

    //せん
    if(central-dis-width + x_adjust < uv.x && uv.x < central-dis+x_adjust){
        if(under_half_pos + y_adjust < uv.y && uv.y < over_half_pos + y_adjust){
            fragColor = vec4(1.0);
        }
    }
    //点々
    if(central-(width/2.0) + x_adjust < uv.x && uv.x < central+(width/2.0) + x_adjust){
        if(central-(width/2.0) + y_adjust < uv.y && uv.y < central+(width/2.0) + y_adjust){
            fragColor = vec4(1.0);
        }
    }
    if(central-dis+x_adjust< uv.x && uv.x < central-dis+width+x_adjust){
        if(over_half_pos + y_adjust < uv.y && uv.y < over_half_pos + width + y_adjust){
            fragColor = vec4(1.0);
        }
        if(under_half_pos - width + y_adjust < uv.y && uv.y < under_half_pos + y_adjust){
            fragColor = vec4(1.0);
        }
    }
    if(central+dis+x_adjust < uv.x && uv.x < central+dis+width+x_adjust){
        if(under_half_pos + y_adjust < uv.y && uv.y < over_half_pos + y_adjust){
            fragColor = vec4(1.0);
        }
    }
    if(central+dis-width+x_adjust< uv.x && uv.x < central+dis+x_adjust){
        if(over_half_pos + y_adjust < uv.y && uv.y < over_half_pos + width + y_adjust){
            fragColor = vec4(1.0);
        }
        if(under_half_pos - width + y_adjust < uv.y && uv.y < under_half_pos + y_adjust){
            fragColor = vec4(1.0);
        }
    }
    if(central+dis + y_adjust < uv.y && uv.y < central+dis+width + y_adjust){
        if(under_half_pos +x_adjust< uv.x && uv.x < over_half_pos+x_adjust){
            fragColor = vec4(1.0);
        }
    }
    if(central+dis-width + y_adjust< uv.y && uv.y < central+dis + y_adjust){
        if(over_half_pos+x_adjust < uv.x && uv.x < over_half_pos + width+x_adjust){
            fragColor = vec4(1.0);
        }
        if(under_half_pos - width +x_adjust< uv.x && uv.x < under_half_pos+x_adjust){
            fragColor = vec4(1.0);
        }
    }
    if(central-dis  + y_adjust < uv.y  && uv.y < central-dis+width + y_adjust){
        if(under_half_pos+x_adjust < uv.x && uv.x < over_half_pos+x_adjust){
            fragColor = vec4(1.0);
        }
    }
    if(central-dis+width + y_adjust< uv.y  && uv.y < central-dis+width+width + y_adjust){
        if(over_half_pos+x_adjust < uv.x && uv.x < over_half_pos + width+x_adjust){
            fragColor = vec4(1.0);
        }
        if(under_half_pos+x_adjust - width < uv.x && uv.x < under_half_pos+x_adjust){
            fragColor = vec4(1.0);
        }
    }
}