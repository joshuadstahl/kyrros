#!/bin/bash

# Exit immediately if any command fails
set -e

echo "===================================================="
echo " Starting kyrrOS Platform Build Suite "
echo "===================================================="

# 1. Initialize core Android build environment
echo "--> Initializing environment tools..."
source build/envsetup.sh

# 2. Load the official LineageOS bluejay base target configuration
echo "--> Loading baseline LineageOS device maps..."
breakfast bluejay

# 3. Inject custom branding & identity overrides
echo "--> Injecting custom branding environment overrides..."
export PRODUCT_BRAND_NAME="KyrrOS"
export LINEAGE_VERSION_APPEND="Custom-Edition"
export PRODUCT_MOD_DEVICE="bluejay_kyrr"
export LINEAGE_BUILDTYPE="KyrrOS-RELEASE"

# 4. Inject Custom Fonts into the active compilation tree
echo "--> Mapping custom EBGaramond prebuilt font modules..."
CUSTOM_FONTS="EBGaramond-Regular.ttf EBGaramond-Bold.ttf EBGaramond-Italic.ttf EBGaramond-BoldItalic.ttf"
export PRODUCT_PACKAGES="$PRODUCT_PACKAGES $CUSTOM_FONTS"

# 5. Inject font customization runtime mapping and custom boot animation
echo "--> Injecting custom product asset copy targets..."
FONT_XML_HOOK="packages/apps/kyrros/fonts/fonts_customization.xml:product/etc/fonts_customization.xml"
BOOT_ANIM_HOOK="packages/apps/kyrros/bootanimation/bootanimation.zip:product/media/bootanimation.zip"

export PRODUCT_COPY_FILES="$PRODUCT_COPY_FILES $FONT_XML_HOOK $BOOT_ANIM_HOOK"

# 6. Clear out stale ninja map caches to force execution recalculation
#echo "--> Evicting old blueprint compilation caches..."
#rm -rf out/soong/build.lineage_bluejay.ninja out/soong/.intermediates/

# 7. Execute the Blueprint Mapping phase to verify everything links cleanly
echo "--> Running environment configuration check (m nothing)..."
m nothing

echo "===================================================="
echo " Setup complete! Ready to compile. "
echo " To build the flashable zip, run: m bacon "
echo "===================================================="