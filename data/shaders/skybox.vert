//  SuperTuxKart - a fun racing game with go-kart
//  Copyright (C) 2013 the SuperTuxKart team
//
//  This program is free software; you can redistribute it and/or
//  modify it under the terms of the GNU General Public License
//  as published by the Free Software Foundation; either version 3
//  of the License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


// Creates a bubble (wave) effect by distorting the texture depending on time
#version 130
uniform float time;

varying vec2 uv;
varying vec2 uv_anim;
varying vec2 uv_cl;
varying vec2 uv_fast;

varying vec3 vertex;


void main()
{
    gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;
    gl_Position = ftransform();


    float delta_x = cos(time*3.0) * sin( 4.0 * gl_TexCoord[0].st.s * 6.28318531 );
    float delta_y = cos(time*2.0) * sin( 3.0 * gl_TexCoord[0].st.t * 6.28318531 );

    vertex      = gl_Vertex.xyz;

    uv = gl_TexCoord[0].st;
    
    
    uv_anim = gl_TexCoord[0].st + vec2(0.002*time, 0);
    uv_cl = gl_TexCoord[0].st + vec2(-0.001*time, 0);
    
    uv_fast = gl_TexCoord[0].st + vec2(0.005*time, 0);
}
