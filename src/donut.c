// https://www.a1k0n.net/2011/07/20/donut-math.html
// ^ has incorrect logic for when to add point to output,
//   and it neglects doubling the x coordinate to correct
//   for the fact that characters aren't squares
// https://www.youtube.com/watch?v=sW9npZVpiMI

#include <strings.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <math.h>

const float obj_scaling = 30; // eye to screen dist
const int screen_height = 22;
const int screen_width = 80;
const float spacing = 1;

// direction of light from the object (opposite of the source)
const int lightvec[3] = {0, 1, -1};
const float R1 = 1;
const float R2 = 2;
const float eye_to_obj_dist = 10; // funky scaling
const float dtheta = 0.07 * spacing;
const float dphi = 0.02 * spacing;

// [ cos B  sin B  0 ][ 1     0      0   ][ cos p  0  sin p ][     0      ]
// [-sin B  cos B  0 ][ 0   cos A  sin A ][   0    1    0   ][  R1*sinT   ]
// [   0      0    1 ][ 0  -sin A  cos A ][-sin p  0  cos p ][R2 + R1*cosT]
// 
// uses zbuffer so we only print the closest point in our xy projection
// z axis is into the screen, we add eye_to_obj_dist to get distance from eye
void render(float a, float b) {
    char (*output)[screen_height] = malloc(sizeof(char[screen_width][screen_height]));
    float (*zbuf)[screen_height] = malloc(sizeof(float[screen_width][screen_height]));
    memset(output, ' ', sizeof(char)*screen_height*screen_width);
    memset(zbuf, 0, sizeof(float)*screen_height*screen_width);
    float theta, phi;
    float sinA = sin(a), cosA = cos(a);
    float sinB = sin(b), cosB = cos(b);
    for (int i = 0; (theta = i*dtheta) < 2*M_PI; i++) {
        for (int j = 0; (phi = j*dphi) < 2*M_PI; j++) {
            float sinP = sin(phi), cosP = cos(phi);
            float sinT = sin(theta), cosT = cos(theta);

            // these are the distances around the circle from the origin
            float cy = R1*sinT;
            float cz = R2 + R1*cosT;
            float x = cosB*cz*sinP + sinB*(cy*cosA + cz*cosP*sinA);
            float y = -sinB*cz*sinP + cosB*(cy*cosA + cz*cosP*sinA);
            float z = cosA*cosP*cz - sinA*cy;
            float ooz = 1/(eye_to_obj_dist + z); // "one over z"

            // luminance = light source inner product surface normal vector
            float nx = cosB*cosT*sinP + sinB*(sinT*cosA + cosT*cosP*sinA);
            float ny = -sinB*cosT*sinP + cosB*(sinT*cosA + cosT*cosP*sinA);
            float nz = -sinA*sinT + cosA*cosP*cosT;
            float lum = nx*lightvec[0] + ny*lightvec[1] + nz*lightvec[2];

            // projections
            // 2* for x because characters are twice as high as they are wide
            // negative for y because the output is indexed downward for y
            int xp = screen_width/2 + 2*ooz*obj_scaling*x;
            int yp = screen_height/2 - ooz*obj_scaling*y;
            int on_screen = screen_height > yp && screen_width > xp && yp > 0 && xp > 0;

            if (ooz > zbuf[xp][yp] && on_screen) {
                zbuf[xp][yp] = ooz;
                // repurpose x, y, z
                x = lightvec[0], y = lightvec[1], z = lightvec[2];
                float magnitude_correction = ceil(11/sqrt(x*x + y*y + z*z));
                int lum_index = lum > 0 ? magnitude_correction*lum : 0;
                output[xp][yp] = ".,-~:;=!*#$@"[lum_index];
            }
        }
    }
    printf("\x1b[H");
    for (int j = 0; j < screen_height; j++)
        for (int i = 0; i < screen_width+1; i++)
            putchar(i != screen_width ? output[i][j] : '\n');
}

int main() {
    float a = 0, b = 0;
    while (1) {
        a += 0.04;
        b += 0.02;
        render(a, b);
        usleep(20*1000);
    }
}

// // online version
//              k;double sin()
//          ,cos();main(){float A=
//        0,B=0,i,j,z[1760];char b[
//      1760];printf("\x1b[2J");for(;;
//   ){memset(b,32,1760);memset(z,0,7040)
//   ;for(j=0;6.28>j;j+=0.07)for(i=0;6.28
//  >i;i+=0.02){float c=sin(i),d=cos(j),e=
//  sin(A),f=sin(j),g=cos(A),h=d+2,D=1/(c*
//  h*e+f*g+5),l=cos      (i),m=cos(B),n=s\
// in(B),t=c*h*g-f*        e;int x=40+30*D*
// (l*h*m-t*n),y=            12+15*D*(l*h*n
// +t*m),o=x+80*y,          N=8*((f*e-c*d*g
//  )*m-c*d*e-f*g-l        *d*n);if(22>y&&
//  y>0&&x>0&&80>x&&D>z[o]){z[o]=D;;;b[o]=
//  ".,-~:;=!*#$@"[N>0?N:0];}}/*#****!!-*/
//   printf("\x1b[H");for(k=0;1761>k;k++)
//    putchar(k%80?b[k]:10);A+=0.04;B+=
//      0.02;}}/*****####*******!!=;:~
//        ~::==!!!**********!!!==::-
//          .,~~;;;========;;;:~-.
//              ..,--------,*/
//

