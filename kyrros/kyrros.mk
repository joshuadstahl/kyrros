# Branding overrides
PRODUCT_BRAND_NAME := KyrrOS
#PRODUCT_MOD_DEVICE := bluejay_kyrr

# Custom EBGaramond fonts and RRO
CUSTOM_FONTS := \
    EBGaramond-Regular.ttf \
    EBGaramond-Medium.ttf \
    EBGaramond-SemiBold.ttf \
    EBGaramond-Bold.ttf \
    EBGaramond-ExtraBold.ttf \
    EBGaramond-Italic.ttf \
    EBGaramond-MediumItalic.ttf \
    EBGaramond-BoldItalic.ttf \
    EBGaramond-SemiBoldItalic.ttf \
    EBGaramond-ExtraBoldItalic.ttf

PRODUCT_PACKAGES += \
    $(CUSTOM_FONTS) \
    CustomFontOverlay \
	kyrros_fonts_customization

# Font XML mapping
#PRODUCT_COPY_FILES += \
#    packages/apps/kyrros/fonts/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Custom boot animation
TARGET_CUSTOM_BOOTANIMATION := packages/apps/kyrros/bootanimation/bootanimation.zip