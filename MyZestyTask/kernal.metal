//
//  kernal.metal
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h>

extern "C" {
    namespace coreimage {
        float4 customTransformation(sample_t s) {
            return  s.rgba * 2 ;
        }
    }
}
