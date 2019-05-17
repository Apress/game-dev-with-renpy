[_tb_system_call storage=system/_scene1.ks]

[cm  ]
[bg  time="1000"  method="puffIn"  storage="platform1.jpg"  ]
[tb_show_message_window  ]
[tb_start_text mode=1 ]
After running what felt like a marathon, you reach Euston train station, panting heavily. No one seems to have been following you. You remember the girl's advice and look for the next northbound train.[p]
[_tb_end_text]

*poop

[tb_hide_message_window  ]
[chara_show  name="Claire"  time="1000"  wait="false"  left="19"  top="50"  width=""  height=""  reflect="false"  ]
[tb_start_tyrano_code]
[filter layer="base" blur=8]

[_tb_end_tyrano_code]

[tb_show_message_window  ]
[tb_start_text mode=1 ]
"Excuse me!", you suddenly hear. Out of nowhere, a dark-haired woman dashes in front of you, blocking entrance to the train. "Is this the train to Nottingham?" She gives a wide smile.[p]
[_tb_end_text]

[tb_hide_message_window  ]
[tb_show_message_window  ]
[tb_start_tyrano_code]
[filter layer="base" blur=0]
[_tb_end_tyrano_code]

[chara_hide  name="Claire"  time="1000"  wait="true"  pos_mode="true"  ]
[bg  time="1000"  method="crossfade"  storage="train2.jpg"  ]
[tb_start_tyrano_code]
;Set your intoxication level to zero using a custom variable "f.rumlevel"
[eval exp="f.rumlevel = 0"]
;The [r] tag inserts a new line
The way she appeared out of nowhere makes her suspect. You confirm this is the correct train and push past her. [r]
;The [l] tag makes the game wait for a mouse click, while the [cm] tag clears all text.
You find your seat and soon the train starts its trek. [l][cm]
;Start playback of a looped ambient track
[fadeinbgm storage=train_01.wav loop=true time=3000]
;Display a new background image
[bg storage=train1.jpg time=6000 wait=true]
Claire dons a pair of headphones and closes her eyes.[r]
You're pleased there's no more small talk to interrupt your flow of thoughts.[l][cm]
;Let's play a little (unskippable) movie
[movie storage=interlude.webm skip=false]
;Let's then implement some interaction, shall we?
Pulling out her headphones, Claire suddenly offers a drink from a hip flask.[l]
[dialog type="confirm" text="Drink?" label_ok="Yes, please." storage="scene1.ks" target="yes_label" label_cancel="No,thanks.." storage_cancel="scene1.ks" target_cancel="no_label"]

[_tb_end_tyrano_code]

*no_label

[tb_start_tyrano_code]
[cm]You decline. "Suit yourself", Claire says taking a long sip from her flask.[l]
;Jump over the yes_label choice
[jump storage=scene1.ks target=*continue]
[_tb_end_tyrano_code]

*yes_label

[tb_start_tyrano_code]
[playse storage=gulp.wav loop=false ]
;Add your intoxication-level by one
[eval exp="f.rumlevel = f.rumlevel +1"]
[cm]You agree. "Here you go..", Claire says offering you the flask. It's some type of rum.[l]
[_tb_end_tyrano_code]

*continue

[tb_show_message_window  ]
[tb_start_tyrano_code]
[cm]Passing rows of drowsy commuters, a bald man in blue farmer's overalls approaches you and Claire.[l][r]
He seems out of place and somewhat strange in his mannerisms.[p]
He triggers something in you. You instinctively move towards the corridor.[r]Claire glances over and nods at the strange man.[p]
;The plot thickens
You begin pacing down the train corridor to the opposite direction. The bald man follows.[l][r]You're being chased.[l][cm]
[bg storage=train3.jpg time=3000 wait=false]You find your way into a toilet and lock the door. [playse storage=knock.ogg loop=false ]Loud knocks sound off in your eardrums. You're trapped.[l][cm]
;Evaluate and display variable
[if exp="f.rumlevel==1"] You feel a little tipsy..Your rum-level is [emb exp=f.rumlevel].
[endif]

;Play some audio and display one of three random lines of narration
[playse storage=phone.wav loop=true ]
[cm][eval exp="f.random_number = Math.floor((Math.random() * 3) + 1)"]
[if exp="f.random_number==1"]Your ancient telephone rings. [endif]
[if exp="f.random_number==2"]The nearly fossilized mobile phone is ringing. [endif]
[if exp="f.random_number==3"]The relic of a telephone drowns out all other noises. [endif]
[p]
;Display Raine and stop the phone from ringing
[chara_config ptext=true]
[chara_show name="Raine" wait=true top=40 left=50]
[stopse]
"You're on your way. Good. Are they after you?"[p]
"Just wait. Stay put. They're not authorized to use full force."[p]
[anim name="Raine" time=2000 left=800 top=40]
"I need you to leave the train at the next stop. Do you hear me?" The woman hangs up.
[filter name="Raine" blur=20][chara_hide name="Raine" time=1000 wait=true]
[p]
Puzzled, you do what you're told. [playse storage=knock.ogg][quake count=3 time=300 hmax=10]
The knocking continues for another five minutes or so then abruptly stops.
[playse storage=knock.ogg volume=30][p]
[bg storage=train2.jpg time=3000 wait=true]
You open the toilet door warily; There's no one behind it. Claire is gone as is the bald man.[p]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
You hear an announcement: next stop <b><i>Bedford!</i></b>[p]
;Change backdrop
[bg storage="platform1.jpg"]

@camera zoom=2 from_zoom=1 x=180 y=100 time=2000
;Reset Camera position.
@reset_camera

;Fade out the train ambience
[fadeoutbgm time=3000]
As soon as the train stops, you're out on the streets, looking over your shoulder. No one seems to be following you.[p]
[eval exp="f.rumlevel = 0"]
[if exp="f.rumlevel==1"]  [jump target=*still_tipsy]
[else] [jump target=*full_of_energy][endif]

;Add a label
*still_tipsy
You are somewhat drowsy. But you must go on.[p] [jump target=*resume_story]

;Add a second label
*full_of_energy
You feel adrenaline surging in your veins.[p]

*resume_story
Only a mere minute into the crowds, you're grabbed by the arm![p]
;Define two macros
[macro name="redtag"][font color=0xff0000][endmacro]
[macro name="yellowtag"][font color=0xffff00][endmacro]
[redtag]"I think we should find a quieter venue to talk", a vaguely familiar voice tells you. It's <b>Royston Honeybun</b> from tech support.[p]
[bg storage="park.jpg"][chara_config name="Royston" ptext="chara_name_area"]
[chara_show name="Royston" wait=true top=40 left=50]
[yellowtag]"I sent you the email in your friend's name. Sorry about that."[p]
[chara_mod name="Royston" storage="chara/6/Roy2.png" time=0][resetfont]
"I had to get you out of there", he says.[p]

;Add some inline images
[macro name="phone"][graph storage="Cellphone.png"][endmacro]
[chara_mod name="Royston" storage="chara/6/Roy.png" time=0]
The upcoming government firewall, August, is designed to be perfect. Turn out you made it too perfect.[p]
A faction of the government needs backdoors in it, vulnerabilities which can be utilized at their will, Mervyn explains.[p]
You're told to wait for a call. [phone] It'll be Raine, you spoke with her on the train.[p]
[chara_hide name="Royston" time=2000 wait=true]
;Add graphical buttons
*cool_buttons
[glink target="ponder" text="Ponder" size=20 width="300" y=250 color=rosy font_color=0x000000]
[glink target="try" text="Relax" size=20 width="300" y=300 color=blue]
[glink target="resume_adventure" text="Onwards!" size=20 width="300" y=350 color=gray]
[s]
*ponder
You stay behind on the park bench, digesting everything you were just told. [p][jump target=*resume_adventure]
*try
You do your best to not ponder recent events, but you fail.[p]
*resume_adventure
What's this? Oh, you've reached the end of this tutorial game. See the project files for the source code.[p]
[position opacity=0][quake count=3 time=200 hmax=20]
[live2d_new name="Nasuka"] [live2d_show name="Nasuka"]
[live2d_trans name="Nasuka" time=2000 left=200 top=-200]
[live2d_motion name="Nasuka" filenm="pleased.mtn" idle="ON" ]
[wait time="2000"]
[live2d_motion name="Nasuka" filenm="idle.mtn" idle="ON" ]
[mtext text="Cheerio!" layer=2 size=48 x=680 y=160 in_effect="bounceIn" out_effect="hinge"]
[live2d_scale name="Nasuka" scaleX=4.8 scaleY=4.8 time=3000]
[live2d_opacity name="Nasuka" opacity=0 time=4000]
[wait time="3000"] [close ask=false]
[_tb_end_tyrano_code]

[s  ]
