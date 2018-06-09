globals [in-game buffer level in-between lives lost deaded]
patches-own [field]
breed [walls wall]
breed [players player]
breed [hearts heart]
players-own [charge velocity]

to setup
  clear-all
  ;ask patches [set pcolor [ [random 255] 255 255]]
  draw-grid
  ;color-checker
  color-gray
  ;color-orange
  ;color-purple
  spawn-player
  ;draw-wall 0 0 0 .5
  ;draw-wall 0 0 90 .5
  ;draw-wall 0 0 180 .5
  ;draw-wall 0 0 270 .5
  set in-game false
  set in-between false
  set lost false
  set deaded false
  set level 0
  set lives 3
  reset-ticks
end

to setup-level
  ifelse lost [
    user-message "You are out of lives. Please click init-setup to restart game"
  ]
  [
    ifelse in-game [
      user-message "You are ingame. Please wait for the round to resolve"
    ]
    [
      ;clear-all
      clear-drawing
      clear-patches
      draw-grid
      color-gray
      spawn-player
      spawn-walls
      reset-ticks
    ]
  ]
end

to spawn-lives
  if (random 10) = 0 [
    ask patch ((random 5) - 2) ((random 5) - 2) [
      sprout-hearts 1 [
        set shape "star"
        set size .3
        set color pink
      ]
    ]
  ]
end

to kill-lives
  ask hearts [
    die
  ]
end

to spawn-walls
  if level = 0[
  ]
  if level = 1[
    draw-wall 2 2 270 0.5
  ]
  if level = 2[
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 3[
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 4[
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 5[
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 6[
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 7[
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 8[
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 9[
    draw-wall 0 2 270 0.5
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 10[
    draw-wall 0 1 270 0.5
    draw-wall 0 2 270 0.5
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 11[
    draw-wall 0 0 270 0.5
    draw-wall 0 1 270 0.5
    draw-wall 0 2 270 0.5
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 12[
    draw-wall 0 -1 270 0.5
    draw-wall 0 0 270 0.5
    draw-wall 0 1 270 0.5
    draw-wall 0 2 270 0.5
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 13[
    draw-wall -1 -2 270 0.5
    draw-wall 0 -1 270 0.5
    draw-wall 0 0 270 0.5
    draw-wall 0 1 270 0.5
    draw-wall 0 2 270 0.5
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 14[
    draw-wall -1 -1 270 0.5
    draw-wall -1 -2 270 0.5
    draw-wall 0 -1 270 0.5
    draw-wall 0 0 270 0.5
    draw-wall 0 1 270 0.5
    draw-wall 0 2 270 0.5
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 15[
    draw-wall -1 0 270 0.5
    draw-wall -1 -1 270 0.5
    draw-wall -1 -2 270 0.5
    draw-wall 0 -1 270 0.5
    draw-wall 0 0 270 0.5
    draw-wall 0 1 270 0.5
    draw-wall 0 2 270 0.5
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
  if level = 16[
    draw-wall -1 1 270 0.5
    draw-wall -1 0 270 0.5
    draw-wall -1 -1 270 0.5
    draw-wall -1 -2 270 0.5
    draw-wall 0 -1 270 0.5
    draw-wall 0 0 270 0.5
    draw-wall 0 1 270 0.5
    draw-wall 0 2 270 0.5
    draw-wall 1 1 270 0.5
    draw-wall 1 0 270 0.5
    draw-wall 1 -1 270 0.5
    draw-wall 1 -2 270 0.5
    draw-wall 2 -1 270 0.5
    draw-wall 2 0 270 0.5
    draw-wall 2 1 270 0.5
    draw-wall 2 2 270 0.5
  ]
end

to random-walls
  let i 0
  loop [
    ifelse i >= level [
      stop
    ]
    [
      draw-wall ((random 5) - 2) ((random 5) - 2) ((random 4) * 90) .5
      set i (i + 1)
    ]
  ]
end

to draw-grid
  ask patches[
    if abs pxcor < 2 and abs pycor < 2 [
      sprout 1 [;creating grid
        set color white
        set heading 0
        set pen-size 1
        fd .5
        pen-down
        rt 90
        fd .5
        rt 90
        fd 1
        rt 90
        fd 1
        rt 90
        fd 1
        rt 90
        fd .5
      ]
    ]
    if pxcor = -2 and pycor != 2[
      sprout 1 [;creating grid
        set color white
        set heading 0
        set pen-size 1
        fd .5
        set heading 90
        fd .5
        pen-down
        set heading 270
        fd .99
      ]
    ]
    if pycor = 2 and pxcor != 2[
      sprout 1[
        set color white
        set heading 180
        set pen-size 1
        fd .5
        set heading 90
        fd .5
        pen-down
        set heading 0
        fd .99
      ]
    ]
    if pxcor = 2 and pycor != 2[
      sprout 1[
        set color white
        set heading 0
        set pen-size 1
        fd .5
        set heading 270
        fd .5
        pen-down
        set heading 90
        fd .99
      ]
    ]
    if pycor = -2 and pxcor != 2[
      sprout 1[
        set color white
        set heading 0
        set pen-size 1
        fd .5
        set heading 90
        fd .5
        pen-down
        set heading 180
        fd .99
      ]
    ]
  ]
  ask turtles[
    if breed != hearts [
      ;user-message "hello world"
      die
    ]
  ]
end

to color-checker
 ask patches[
    ifelse (pxcor + pycor) mod 2 = 0[;coloring fields
      ifelse pxcor = 2 and pycor = 2 [
        set pcolor red
      ]
      [
        set field -10
        set pcolor orange + (field * .1) + 1
      ]
    ]
    [
      set field 10
      set pcolor violet + (field * .1) - 1
    ]
    ifelse pcolor != red[
      set plabel field
    ]
    [
      set plabel "WIN"
    ]
  ]
end

to color-gray
   ask patches[
    ifelse pxcor = 2 and pycor = 2 [
      set pcolor red
      set plabel "WIN"
    ]
    [
      set pcolor gray
      set field 0
    ]
  ]
end

to color-orange
   ask patches[
    ifelse pxcor = 2 and pycor = 2 [
      set pcolor red
      set plabel "WIN"
    ]
    [
      set field -10
      set pcolor orange + (field * .1) + 1
      set plabel field
    ]
  ]
end

to color-purple
   ask patches[
    ifelse pxcor = 2 and pycor = 2 [
      set pcolor red
      set plabel "WIN"
    ]
    [
      set field 10
      set pcolor violet + (field * .1) - 1
      set plabel field
    ]
  ]
end

to spawn-player
  create-players 1[
    set xcor -2
    set ycor starting-block
    set heading 90 - theta
    set color white
    set size .6
    set velocity init-velocity
    if particle = "electron" [;electron
      set charge -1
      set shape "electron-shape"
    ]
    if particle = "proton" [;proton
      set charge 1
      set shape "proton-shape"
    ]
  ]
end

to create-fields
  if in-game [
    user-message "You are in game. You cannot create-fields while in game"
    stop
  ]
  if mouse-down? and not in-game[
    ask patch mouse-xcor mouse-ycor [;user input patches
      if pcolor != red[
        if click-for-field = "into the page"[
          set field 10
          set pcolor violet  + (field * .1) - 1
        ]
        if click-for-field = "out of the page"[
          set field -10
          set pcolor orange + (field * .1) + 1
        ]
        set plabel field
      ]
    ]
  ]
end

to change-intensity
  if in-game [
    user-message "You are in game. You cannot change-intensity while in game"
    stop
  ]
  if mouse-down? and not in-game[
    ask patch mouse-xcor mouse-ycor [;user input patches
      if pcolor != red[
        ifelse buffer = 0 [
          if intensity = "plus" [
            if not ((field + delta-intensity) > 40) [
              set field (field + delta-intensity)
              ifelse field > 0 [
                set pcolor violet + (field * .1) - 1
              ]
              [
                set pcolor orange + (field * .1) + 1
              ]
            ]
          ]
          if intensity = "minus" [
            if not ((field - delta-intensity) < -40) [
              set field (field - delta-intensity)
              ifelse field < 0 [
                set pcolor orange + (field * .1) + 1
              ]
              [
                set pcolor violet + (field * .1) - 1
              ]
            ]
          ]
          if field = 0 [
           set pcolor gray
          ]
          set plabel field
          ;set buffer 2000 ;offline
          set buffer 3 ;online
        ]
        [
          set buffer (buffer - 1)
        ]
      ]
    ]
  ]

end

to mag-force
  ask patches with [field > 0][;if field is into page
    ask players-here with [charge = 1][;and proton
      lt field * .1
    ]
    ask players-here with [charge = -1][;and electron
      rt field * .1
    ]
  ]
  ask patches with [field < 0][;if field out of page
    ask players-here with [charge = 1][;and proton
      lt field * .1
    ]
    ask players-here with [charge = -1][;and electron
      rt field * .1
    ]
  ]
end

to move-vel
  ask players [;moving
      fd velocity;.02
      wait .02
  ]
end

to edge-detect
  ask turtles [;edge detection
    if xcor > 2.4 or xcor < -2.4 or ycor > 2.4 or ycor < -2.4[
      set color black
    ]
  ]
end

to check-win
  let won false
  ask players [ ;winning
    ask patch-here[
     if plabel = "WIN"[
        set won true
      ]
    ]
    if won [
      stamp
      die
    ]
  ]
  if won [
    user-message "Good Job Ms. Sharaf! You have completed this level."
    set won false
    next-level
  ]
end

to draw-wall [x y phi len]
  let i 0.1
  ask patch x y [
    sprout-walls 1 [
      set shape "wall"
      set color black
      set heading phi
      fd .5
    ]
    loop [
      ifelse i > len [
       stop
      ]
      [
        sprout-walls 1 [
          set shape "wall"
          set color black
          set heading phi
          fd .5
          rt 90
          fd i
        ]
        sprout-walls 1 [
          set shape "wall"
          set color black
          set heading phi
          fd .5
          lt 90
          fd i
        ]
        set i (i + .1)
      ]
    ]
  ]
end

to wall-detect
  ask walls [
    ask players in-radius 0.1 [
     set color black
    ]
  ]
end

to death-detect
  let dead false
  ask players [
    if color = black [
      set in-game false
      set dead true
      set deaded true
      stamp
      set lives (lives - 1)
      die
    ]
  ]
  if dead [
    ifelse lives = 0 [
      user-message "You are out of lives. Please click init-setup to restart game"
      set lost true
    ]
    [
      user-message "You lost a life. Please click setup-level after making changes"
      setup-level
    ]
    set dead false
  ]
end

to next-level
  set level (level + 1)
  add-live
  set in-game false
  setup-level
  set in-between true
  kill-lives
  spawn-lives
end

to heart-detect
  ask players [
    ask hearts in-radius 0.1 [
      set lives (lives + 1)
      die
    ]
  ]
end

to add-live
  if level mod 5 = 0 [
    set lives (lives + 1)
    user-message "Congrats on passing five levels. You gained a life!"
  ]
end

to-report report-level
  report level
end

to-report report-lives
  report lives
end

to go
  if deaded [
    set deaded false
    stop
  ]
  set in-game true
  mag-force
  move-vel
  edge-detect
  wall-detect
  heart-detect
  check-win
  if in-between [
    set in-between false
    stop
  ]
  death-detect
end
@#$#@#$#@
GRAPHICS-WINDOW
818
96
1326
605
-1
-1
100.0
1
15
1
1
1
0
0
0
1
-2
2
-2
2
0
0
1
ticks
50.0

BUTTON
383
248
476
281
go
go
T
1
T
OBSERVER
NIL
G
NIL
NIL
1

BUTTON
283
248
376
281
init-setup
setup
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

SLIDER
97
408
306
441
theta
theta
0
360
61.0
1
1
NIL
HORIZONTAL

CHOOSER
98
357
307
402
particle
particle
"electron" "proton"
1

CHOOSER
410
356
552
401
click-for-field
click-for-field
"into the page" "out of the page"
1

BUTTON
410
406
553
439
create-fields
create-fields
T
1
T
OBSERVER
NIL
K
NIL
NIL
1

SLIDER
96
447
307
480
starting-block
starting-block
-2
2
-2.0
1
1
from center tile
HORIZONTAL

SLIDER
96
488
307
521
init-velocity
init-velocity
0.005
0.05
0.05
0.005
1
NIL
HORIZONTAL

BUTTON
572
470
716
503
change-intensity
change-intensity
T
1
T
OBSERVER
NIL
L
NIL
NIL
1

CHOOSER
571
509
717
554
intensity
intensity
"plus" "minus"
1

TEXTBOX
572
367
722
409
Cannot use create-fields and change-intensity after go has been pressed
11
0.0
1

SLIDER
571
560
718
593
delta-intensity
delta-intensity
1
10
10.0
1
1
NIL
HORIZONTAL

TEXTBOX
413
480
563
578
For positive field values (initially violet), the lighter the color the stronger the intensity. For negative field values, (initially orange), the darker the color the stronger the intensity
11
0.0
1

BUTTON
96
546
307
579
setup-level
setup-level
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

MONITOR
282
187
377
232
Level
report-level
2
1
11

MONITOR
382
187
477
232
# Lives
report-lives
1
1
11

TEXTBOX
251
88
530
160
CoolPhysicsGames
30
0.0
1

TEXTBOX
240
123
578
173
by Xing Tao Shi & Henry Zheng
20
0.0
1

@#$#@#$#@
# CoolPhysicsGames
#### Xing Tao Shi and Henry Zheng
#### AP Physics C pd9/10
#### Final Project

## DEMONSTRATION VIDEO

## WHAT IS IT?

CoolPhysicsGames is a physics game that attempts to teach users about magnetic fields through the use of a interactive education experience. Users will be able to modify fields, type of particle, velocity of particle, and angle of particle. They will use these key components to navigate a particle through an extensive maze of walls in order to get to the end zone and win the game.

## HOW TO PLAY

1. User must click init-setup to initially set up the game.
2. User will then modify any components they wish to change about the particle.
3. User must then click setup-level after confirming their changes to the particle.
4. User can then use create-fields and change-intensity to modify the magnetic fields by clicking on the patch the user would like to modify.
5. User will then press go to enjoy the game!
6. If User runs into the star, they will gain an extra life! <3

## BUTTONS

#### init-setup (A)
Restarts game at level 0.

#### setup-level (S)
Sets up game at current level.

#### create-fields (K)
After pressing this button, user can click on patches to create fields based on click-for-field.

#### change-intensity (L)
After pressing this button, user can click on patches to change intensity of fields based on intensity and delta-intensity.

#### go (G)
Starts the game.

## CHOOSERS

#### particle
Type of particle

#### click-for-field
Type of field

#### intensity
Intensity of field

## SLIDERS

#### theta
Starting angle from +x axis (horizontal)

#### starting-block
Starting block from center tile

#### init-velocity
Initial velocity of particle

#### delta-intensity
Change of intensity when using change-intensity

## COLORS OF PATCHES

Indigo - into the page

Orange - out of the page

Red - goal
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

electron-shape
true
0
Circle -7500403 true true 90 90 120
Rectangle -2674135 true false 105 135 195 165
Polygon -13345367 true false 105 105 150 45 195 105

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

proton-shape
true
0
Circle -7500403 true true 90 90 120
Rectangle -13840069 true false 105 135 195 165
Polygon -13345367 true false 105 105 150 45 195 105
Rectangle -13840069 true false 135 105 165 195

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wall
true
0
Rectangle -7500403 true true 135 135 165 165

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.3
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
