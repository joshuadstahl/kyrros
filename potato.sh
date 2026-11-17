#!/bin/bash
set -e

echo "===================================================="
echo " Starting kyrrOS Platform Build Suite "
echo "===================================================="

# 1. Export supported LineageOS version environment variables BEFORE breakfast
echo "--> Exporting LineageOS version environment variables..."
#export LINEAGE_VERSION_APPEND="Custom-Edition"
export LINEAGE_BUILDTYPE="KyrrOS-RELEASE"

# 2. Initialize core Android build environment
echo "--> Initializing environment tools..."
source build/envsetup.sh

BLUEJAY_MK="vendor/lineage/config/common.mk"
HOOK_LINE="\$(call inherit-product-if-exists, packages/apps/kyrros/kyrros.mk)"

if [ -f "$BLUEJAY_MK" ] && ! grep -q "packages/apps/kyrros/kyrros.mk" "$BLUEJAY_MK"; then
    echo "--> Hooking kyrros.mk into $BLUEJAY_MK..."
    echo "" >> "$BLUEJAY_MK"
    echo "$HOOK_LINE" >> "$BLUEJAY_MK"
fi

# 3. Load the LineageOS bluejay target (automatically inherits kyrros.mk)
echo "--> Loading baseline LineageOS device maps..."
breakfast bluejay

# 4. Verify the Blueprint/Ninja graph
echo "--> Running environment configuration check (m nothing)..."
m nothing

# 5. Compile the flashable ROM zip
echo "--> Building flashable ROM package (m bacon)..."
m bacon

