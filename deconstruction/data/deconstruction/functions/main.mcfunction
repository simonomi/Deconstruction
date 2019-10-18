gamerule commandBlockOutput false

scoreboard objectives add give trigger
scoreboard players enable @a give
execute as @a[scores={give=1..}] run function deconstruction:give_items
scoreboard players set @a[scores={give=1..}] give 0

effect give @a jump_boost 9999 1 true


tag @e[type=arrow,tag=!tunnelarrow,nbt={inGround:1b}] add onground

replaceitem entity @a armor.chest minecraft:elytra{Unbreakable:1}

replaceitem entity @a hotbar.8 minecraft:firework_rocket{Fireworks:{Flight:127}}
replaceitem entity @a inventory.8 minecraft:arrow

tag @e[type=minecraft:item,nbt={OnGround:1b}] add onground
kill @e[type=minecraft:item,tag=onground]

tellraw @a[tag=!notnew] ["",{"text":"-=Help=-\n Help:","color":"gold"},{"text":" Hold a sign renamed \"help\".\n "},{"text":"Weapons:","color":"aqua"},{"text":" Just rename an item to whatever the weapon is called (case sensitive).\n\n"},{"text":"-=Bows=-","color":"dark_gray"},{"text":"\n"},{"text":" ","color":"red"},{"text":"Firebow ","color":"dark_red"},{"text":"- Shoots fireballs instead of arrows.\n "},{"text":"Tunneler ","color":"dark_green"},{"text":"- Fills an area around its arrows with air.\n\n"},{"text":"-=Dispenser=-","color":"dark_gray"},{"text":"\n "},{"text":"Bomber ","color":"dark_red"},{"text":"- Rains down TNT on your enemies."},{"text":"\n\n"},{"text":"-=Other=-","color":"green"},{"text":"\n "},{"text":"TNT ","color":"red"},{"text":"- All TNT is more powerful."}]
tag @a add notnew



# Help
tag @a[nbt={SelectedItem:{id:"minecraft:oak_sign",tag:{display:{Name:"{\"text\":\"help\"}"}}}}] add help
tellraw @a[tag=help] ["",{"text":"-=Help=-\n Help:","color":"gold"},{"text":" Hold a sign renamed \"help\".\n "},{"text":"Weapons:","color":"aqua"},{"text":" Just rename an item to whatever the weapon is called (case sensitive).\n\n"},{"text":"-=Bows=-","color":"dark_gray"},{"text":"\n"},{"text":" ","color":"red"},{"text":"Firebow ","color":"dark_red"},{"text":"- Shoots fireballs instead of arrows.\n "},{"text":"Tunneler ","color":"dark_green"},{"text":"- Fills an area around its arrows with air.\n\n"},{"text":"-=Dispenser=-","color":"dark_gray"},{"text":"\n "},{"text":"Bomber ","color":"dark_red"},{"text":"- Rains down TNT on your enemies."},{"text":"\n\n"},{"text":"-=Other=-","color":"green"},{"text":"\n "},{"text":"TNT ","color":"red"},{"text":"- All TNT is more powerful."}]
execute at @a[tag=help] run playsound minecraft:ui.button.click ambient @s
clear @a[tag=help] minecraft:oak_sign{display:{Name:"{\"text\":\"help\"}"}}
tag @a remove help


# # Firebow
tag @a remove Firebow
tag @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{display:{Name:"{\"text\":\"Firebow\"}"}}}}] add Firebow 
execute as @a[tag=Firebow] at @s run execute at @e[type=arrow,distance=0..5] run execute at @a[tag=Firebow,distance=0..5] positioned ~ ~1 ~ rotated as @s run summon fireball ^ ^ ^2 {direction:[0.0,0.0,0.0],ExplosionPower:25}
execute as @a[tag=Firebow] at @s positioned ~ ~1 ~ rotated as @s run tag @e[type=arrow,distance=0..5] add onground


# Tunneler
tag @a remove Tunneler
tag @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{display:{Name:"{\"text\":\"Tunneler\"}"}}}}] add Tunneler 
execute at @a[tag=Tunneler] run tag @e[type=arrow,distance=0..5] add tunnelarrow
execute at @e[type=arrow,tag=tunnelarrow] run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air
execute at @a run fill ~-50 0 ~-50 ~50 0 ~50 bedrock


# instant powerful tnt
execute at @e[type=tnt] run summon fireball ~ ~ ~ {direction:[0.0,-10.0,0.0],ExplosionPower:25}
execute at @e[type=tnt] run setblock ~ ~ ~ red_concrete
kill @e[type=tnt]

# Bomber
tag @a remove Bomber
tag @a[nbt={SelectedItem:{id:"minecraft:dispenser",tag:{display:{Name:"{\"text\":\"Bomber\"}"}}}}] add Bomber 
execute as @a[tag=Bomber] run execute at @p run summon armor_stand ~ ~-1 ~ {Invisible:1,ArmorItems:[{},{},{},{id:tnt,Count:1}],marker:1,Tags:[bomb,air]}

execute as @e[type=armor_stand,tag=bomb] at @s if block ~ ~ ~ tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~ ~-1 ~ tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~1 ~-1 ~ tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~-1 ~-1 ~ tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~ ~-1 ~1 tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~ ~-1 ~-1 tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~1 ~-1 ~-1 tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~-1 ~-1 ~-1 tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~1 ~-1 ~1 tnt run kill @s
# execute as @e[type=armor_stand,tag=bomb] at @s if block ~-1 ~-1 ~1 tnt run kill @s

execute at @e[type=armor_stand,tag=!air,tag=bomb] run setblock ~ ~ ~ tnt
execute as @e[type=armor_stand,tag=!air,tag=bomb] run kill @s

tag @e[type=armor_stand,tag=bomb] remove air
execute as @e[type=armor_stand,tag=bomb] at @s if block ~ ~-1 ~ air run tag @s add air


# Nuke
execute at @e[type=magma_cube,name=Nuke] run fill ~2 ~1 ~2 ~-2 ~-1 ~-2 tnt
execute at @e[type=magma_cube,name=Nuke] run setblock ~ ~ ~ redstone_block
execute at @e[type=magma_cube,name=Nuke] run kill @s

kill @e[type=arrow,tag=inground]

