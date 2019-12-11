#!/bin/bash

# Based on nachoparker's great work
# https://ownyourbits.com/2017/04/05/customize-your-motd-login-message-in-debian-and-ubuntu/

# Enable additional locales
sed -i 's/.\{0,2\}ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen | grep ja_JP
locale-gen

# disable /etc/init.d/motd
systemctl disable motd

# Remove static motd
rm -f /etc/motd

# Create folder to hold motd scripts
mkdir -p /etc/update-motd.d

# Remove "last login" message
sed -i 's/.\{0,1\}PrintLastLog.\{0,5\}$/PrintLastLog no/' /etc/ssh/sshd_config | grep PrintLast 
systemctl restart sshd

# Write the motd script to the folder

echo '#!/bin/bash
# Megumin Lines
Lines[0]="黒より黒く闇より暗き漆黒に我が深紅の混淆を望みたもう。覚醒のとき来たれり。無謬の境界に落ちし理。無行の歪みとなりて現出せよ！踊れ踊れ踊れ、我が力の奔流に望むは崩壊なり。並ぶ者なき崩壊なり。万象等しく灰塵に帰し、深淵より来たれ！これが人類最大の威力の攻撃手段、これこそが究極の攻撃魔法、エクスプロージョン！"
Lines[1]="光に覆われし漆黒よ。夜を纏いし爆炎よ。紅魔の名のもとに原初の崩壊を顕現す。終焉の王国の地に、力の根源を隠匿せし者。我が前に統べよ！エクスプロージョン！"
Lines[2]="紅き黒炎、万界の王。天地の法を敷衍すれど、我は万象昇温の理。崩壊破壊の別名なり。永劫の鉄槌は我がもとに下れ！エクスプロージョン！"
Lines[3]="我が名はめぐみん。紅魔族随一の魔法の使い手にして、爆裂魔法を操りし者。我が力、見るがいい！エクスプロージョン！"
Lines[4]="我が深紅の流出を以て、白き世界を覆さん！エクスプロージョン！"
Lines[5]="光に覆われし漆黒よ。夜を纏いし爆炎よ。他はともかく、爆裂魔法のことに関しては私は誰にも負けたくないのです！行きます！我が究極の破壊魔法、エクスプロージョン！"
Lines[6]="空蝉に忍び寄る叛逆の摩天楼。我が前に訪れた静寂なる神雷。時は来た！今、眠りから目覚め、我が狂気を以て現界せよ！穿て！エクスプロージョン！"
Lines[7]="爆走…爆走…爆走……最高最強にして最大の魔法、爆裂魔法の使い手、我が名はめぐみん。我に許されし一撃は同胞の愛にも似た盲目を奏で、塑性を脆性へと葬り去る。強き鼓動を享受する！"

# Random select エクスプロージョン(Explosion)!
lineNum=$(($RANDOM % ${#Lines[@]}))

# One explosion per day keeps demons away
echo ""
echo "${Lines[$lineNum]}"
echo ""
' > /etc/update-motd.d/15-megumin

# Make the script runnable
chmod 755 /etc/update-motd.d/15-megumin
