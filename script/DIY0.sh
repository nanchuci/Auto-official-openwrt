#/bin/bash
# This is free software, lisence use MIT.
# Copyright (C) https://github.com/nanchuci

# Define My Package
#git clone https://github.com/yfdoor/OpenWrt-AdGuardHome.git                         package/nanchuciadguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git                 package/nanchuci/luci-app-adguardhome
#git clone https://github.com/fw876/helloworld.git                                   package/nanchuci/luci-app-ssr-plus

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf ../lean/luci-theme-argon

#mt-wifi
#svn co https://github.com/nanchuci/openwrt-packages/trunk/luci-app-mtwifi package/lean/luci-app-mtwifi
#svn co https://github.com/nanchuci/openwrt-packages/trunk/mt-drivers package/lean/mt-drivers

#package/lean
svn co https://github.com/nanchuci/lede/trunk/package/lean package/lean
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
