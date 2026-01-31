function bw:stone_fills/fills_stone_full

fill 5 1 -120 -5 28 119 air
fill 5 28 -120 -5 28 119 stone
fill 5 27 -120 4 27 119 stone
fill -5 27 -120 -4 27 119 stone
fill 5 26 -120 5 26 119 stone
fill -5 26 -120 -5 26 119 stone

fill 5 7 -120 -5 7 119 light[level=15]

place feature dripstone_cluster 0 24 -110
place feature dripstone_cluster 0 24 -100
place feature dripstone_cluster 0 24 -90
place feature dripstone_cluster 0 24 -80
place feature dripstone_cluster 0 24 -70
place feature dripstone_cluster 0 24 -60
place feature dripstone_cluster 0 24 -50
place feature dripstone_cluster 0 24 -40
place feature dripstone_cluster 0 24 -30
place feature dripstone_cluster 0 24 -20
place feature dripstone_cluster 0 24 -10
place feature dripstone_cluster 0 24 0
place feature dripstone_cluster 0 24 10
place feature dripstone_cluster 0 24 20
place feature dripstone_cluster 0 24 30
place feature dripstone_cluster 0 24 40
place feature dripstone_cluster 0 24 50
place feature dripstone_cluster 0 24 60
place feature dripstone_cluster 0 24 70
place feature dripstone_cluster 0 24 80
place feature dripstone_cluster 0 24 90
place feature dripstone_cluster 0 24 100
place feature dripstone_cluster 0 24 110

place feature moss_patch_ceiling 0 24 -115
place feature moss_patch_ceiling 0 24 -95
place feature moss_patch_ceiling 0 24 -75
place feature moss_patch_ceiling 0 24 -55
place feature moss_patch_ceiling 0 24 -35
place feature moss_patch_ceiling 0 24 -15
place feature moss_patch_ceiling 0 24 0
place feature moss_patch_ceiling 0 24 15
place feature moss_patch_ceiling 0 24 35
place feature moss_patch_ceiling 0 24 55
place feature moss_patch_ceiling 0 24 75
place feature moss_patch_ceiling 0 24 95
place feature moss_patch_ceiling 0 24 115

fill -120 1 5 119 28 -5 air
fill -120 28 5 119 28 -5 stone
fill -120 27 5 119 27 4 stone
fill -120 27 -5 119 27 -4 stone
fill -120 26 5 119 26 5 stone
fill -120 26 -5 119 26 -5 stone

fill -120 7 5 119 7 -5 light[level=15]

fill 5 26 5 -5 27 -5 air

place feature dripstone_cluster -110 24 0
place feature dripstone_cluster -100 24 0
place feature dripstone_cluster -90 24 0
place feature dripstone_cluster -80 24 0
place feature dripstone_cluster -70 24 0
place feature dripstone_cluster -60 24 0
place feature dripstone_cluster -50 24 0
place feature dripstone_cluster -40 24 0
place feature dripstone_cluster -30 24 0
place feature dripstone_cluster -20 24 0
place feature dripstone_cluster -10 24 0
place feature dripstone_cluster 0 24 0
place feature dripstone_cluster 10 24 0
place feature dripstone_cluster 20 24 0
place feature dripstone_cluster 30 24 0
place feature dripstone_cluster 40 24 0
place feature dripstone_cluster 50 24 0
place feature dripstone_cluster 60 24 0
place feature dripstone_cluster 70 24 0
place feature dripstone_cluster 80 24 0
place feature dripstone_cluster 90 24 0
place feature dripstone_cluster 100 24 0
place feature dripstone_cluster 110 24 0

place feature moss_patch_ceiling -115 24 0
place feature moss_patch_ceiling -95 24 0
place feature moss_patch_ceiling -75 24 0
place feature moss_patch_ceiling -55 24 0
place feature moss_patch_ceiling -35 24 0
place feature moss_patch_ceiling -15 24 0
# this row was done before
place feature moss_patch_ceiling 15 24 0
place feature moss_patch_ceiling 35 24 0
place feature moss_patch_ceiling 55 24 0
place feature moss_patch_ceiling 75 24 0
place feature moss_patch_ceiling 95 24 0
place feature moss_patch_ceiling 115 24 0

fill 3 20 0 3 70 0 air

place template tunnels:emerald -11 11 -11

place template tunnels:blue_bed -5 11 119 counterclockwise_90
place template tunnels:red_bed 5 11 -120 clockwise_90
place template tunnels:green_bed -120 11 -5 none
place template tunnels:yellow_bed 119 11 5 180

place template tunnels:diamond -13 11 63 counterclockwise_90
place template tunnels:diamond 13 11 -64 clockwise_90
place template tunnels:diamond -64 11 -13 none
place template tunnels:diamond 63 11 13 180

#function bw:stone_fills/fills_stone9

scoreboard players set bedBreak game 200

kill @e[type=item]
time set noon

scoreboard players set villagerType game 2
function bw:setvillagers_unified
