gamerule commandblockoutput false
gamerule logadmincommands false

effect @a jump_boost 9999 1 true

execute @a ~ ~ ~ fill ~-50 0 ~-50 ~50 0 ~50 bedrock

scoreboard players tag @e[type=arrow,tag=!tunnelarrow] add inground {inGround:1b}

replaceitem entity @a slot.armor.chest minecraft:elytra 1 0 {Unbreakable:1}

replaceitem entity @a slot.hotbar.8 minecraft:fireworks 1 0 {Fireworks:{Flight:127}}
replaceitem entity @a slot.inventory.8 minecraft:arrow 1 0 

scoreboard players tag @e[type=Item] add onground  {OnGround:1b}
kill @e[type=Item,tag=onground]

tellraw @a[tag=!notnew] ["",{"text":"-=Help=-\n Help:","color":"gold"},{"text":" Hold a sign renamed \"help\".\n "},{"text":"Weapons:","color":"aqua"},{"text":" Just rename an item to whatever the weapon is called (case sensitive).\n\n"},{"text":"-=Bows=-","color":"dark_gray"},{"text":"\n"},{"text":" ","color":"red"},{"text":"Firebow ","color":"dark_red"},{"text":"- Shoots fireballs instead of arrows.\n "},{"text":"Tunneler ","color":"gray"},{"text":"- Fills an area around its arrows with air.\n\n"},{"text":"-=Other=-","color":"green"},{"text":"\n "},{"text":"Tnt ","color":"red"},{"text":"- All tnt is more powerful."}]
scoreboard players tag @a add notnew



#Help
scoreboard players tag @a add help {SelectedItem:{id:"minecraft:sign",tag:{display:{Name:"help"}}}}
tellraw @a[tag=help] ["",{"text":"-=Help=-\n Help:","color":"gold"},{"text":" Hold a sign renamed \"help\".\n "},{"text":"Weapons:","color":"aqua"},{"text":" Just rename an item to whatever the weapon is called (case sensitive).\n\n"},{"text":"-=Bows=-","color":"dark_gray"},{"text":"\n"},{"text":" ","color":"red"},{"text":"Firebow ","color":"dark_red"},{"text":"- Shoots fireballs instead of arrows.\n "},{"text":"Tunneler ","color":"gray"},{"text":"- Fills an area around its arrows with air.\n\n"},{"text":"-=Other=-","color":"green"},{"text":"\n "},{"text":"Tnt ","color":"red"},{"text":"- All tnt is more powerful."}]
execute @a[tag=help] ~ ~ ~ playsound minecraft:ui.button.click ambient @s
clear @a[tag=help] minecraft:sign 0 1 {display:{Name:"help"}}
scoreboard players tag @a remove help


#Firebow
scoreboard players tag @a remove Firebow
scoreboard players tag @a add Firebow {SelectedItem:{id:"minecraft:bow",tag:{display:{Name:"Firebow"}}}}
execute @a[tag=Firebow] ~ ~ ~ execute @e[type=arrow,r=5] ~ ~ ~ summon fireball ~ ~ ~ {direction:[0.0,0.0,0.0],ExplosionPower:25}

#Tunneler
scoreboard players tag @a remove Tunneler
scoreboard players tag @a add Tunneler {SelectedItem:{id:"minecraft:bow",tag:{display:{Name:"Tunneler"}}}}
execute @a[tag=Tunneler] ~ ~ ~ scoreboard players tag @e[type=arrow,r=5] add tunnelarrow
execute @e[type=arrow,tag=tunnelarrow] ~ ~ ~ fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air


#instant powerful tnt
execute @e[type=tnt] ~ ~ ~ summon fireball ~ ~ ~ {direction:[0.0,-10.0,0.0],ExplosionPower:25}
execute @e[type=tnt] ~ ~ ~ setblock ~ ~ ~ concrete 14
execute @e[type=tnt] ~ ~ ~ kill @s

#Bomber
scoreboard players tag @a remove Bomber
scoreboard players tag @a add Bomber {SelectedItem:{id:"minecraft:dispenser",tag:{display:{Name:"Bomber"}}}}
execute @a[tag=Bomber] ~ ~ ~ execute @p ~ ~-1 ~ summon armor_stand ~ ~ ~ {Invisible:1,ArmorItems:[{},{},{},{id:tnt,Count:1}],marker:1}
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ scoreboard players tag @s remove air
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~ ~-1 ~ air 0 scoreboard players tag @s add air

execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~ ~-1 ~ tnt 0 kill @s
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~1 ~-1 ~ tnt 0 kill @s
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~-1 ~-1 ~ tnt 0 kill @s
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~ ~-1 ~1 tnt 0 kill @s
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~ ~-1 ~-1 tnt 0 kill @s
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~1 ~-1 ~-1 tnt 0 kill @s
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~-1 ~-1 ~-1 tnt 0 kill @s
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~1 ~-1 ~1 tnt 0 kill @s
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand] ~ ~ ~ detect ~-1 ~-1 ~1 tnt 0 kill @s

execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand,tag=!air] ~ ~ ~ setblock ~ ~ ~ tnt
execute @a[tag=Bomber] ~ ~ ~ execute @e[type=armor_stand,tag=!air] ~ ~ ~ kill @s


#Nuke
execute @e[type=magma_cube,name=Nuke] ~ ~ ~ fill ~2 ~1 ~2 ~-2 ~-1 ~-2 tnt
execute @e[type=magma_cube,name=Nuke] ~ ~ ~ setblock ~ ~ ~ redstone_block
execute @e[type=magma_cube,name=Nuke] ~ ~ ~ kill @s

kill @e[type=arrow,tag=inground]
