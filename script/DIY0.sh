#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/yfdoor

# Define My Package
git clone https://github.com/yfdoor/OpenWrt-AdGuardHome.git                         package/yfdoor/adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git                 package/yfdoor/luci-app-adguardhome
git clone https://github.com/fw876/helloworld.git                                   package/yfdoor/luci-app-ssr-plus

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon

#mt-wifi
svn co https://github.com/nanchuci/openwrt-packages/trunk/luci-app-mtwifi package2/diy/luci-app-mtwifi
svn co https://github.com/nanchuci/openwrt-packages/trunk/mt-drivers package/lean/mt-drivers
