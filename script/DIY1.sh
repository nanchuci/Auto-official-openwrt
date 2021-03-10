#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/nanchuci

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/E8820S/g' package/base-files/files/bin/config_generate

# 修改开源驱动wifi名称
sed -i 's/OpenWrt/ZTE-E8820S-%s/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改闭源驱动2G wifi名称
sed -i 's/OpenWrt_2G/ZTE-E8820S/g' package/lean/mt/drivers/mt_wifi/files/mt7603.dat

# 修改闭源驱动5G wifi名称
sed -i 's/OpenWrt_5G/ZTE-E8820S-5G/g' package/lean/mt/drivers/mt_wifi/files/mt7612.dat

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' ./package/lean/default-settings/files/zzz-default-settings

# 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
#rm -rf ./package/base-files/files/etc/banne && cd .. && cp -f ./banner openwrt/package/base-files/files/etc/ && cd openwrt

# 更改时区
#sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Define Default
cat > package/lean/default-settings/files/zzz-default-settings <<-EOF
#!/bin/sh    
    # set time zone
    uci set system.@system[0].timezone=CST-8
    uci set system.@system[0].zonename=Asia/Shanghai
    uci commit system
    
    # set distfeeds
    cp /etc/opkg/distfeeds.conf /etc/opkg/distfeeds.conf_BK
    sed -i 's#http://downloads.openwrt.org#http://mirrors.tuna.tsinghua.edu.cn/openwrt#g' /etc/opkg/distfeeds.conf
    sed -i '/yfdoor/d' /etc/opkg/distfeeds.conf
    
    # set firewall
    sed -i '/REDIRECT --to-ports 53/d' /etc/firewall.user
    echo "iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53" >> /etc/firewall.user
    echo "iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53" >> /etc/firewall.user
    
    # Others
    sed -i '/log-facility/d' /etc/dnsmasq.conf
    echo "log-facility=/dev/null" >> /etc/dnsmasq.conf

    sed -i 's/cbi.submit\"] = true/cbi.submit\"] = \"1\"/g' /usr/lib/lua/luci/dispatcher.lua

    echo 'hsts=0' > /root/.wgetrc
    
    rm -rf /tmp/luci*
    exit 0
EOF
