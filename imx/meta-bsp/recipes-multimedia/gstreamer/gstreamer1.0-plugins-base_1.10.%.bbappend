FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# Enable pango lib
PACKAGECONFIG_append = " pango "

# ion allocator will be enabled only when detecting the ion.h exists, which is built out from kernel.
# For now, ion allocatior is supported on mx8
DEPENDS_append_mx8 = " virtual/kernel"

# Remove gio-unix-2.0 as it does not seem to exist anywhere
PACKAGECONFIG_remove = "gio-unix-2.0"
# Overwrite the unrecognised option which is set in gstreamer1.0-plugins-base.inc under poky layer
PACKAGECONFIG[gio-unix-2.0] = ""

# The following "GST_IMX_PATCHES" being defined in meta-freescale layer is applied to imxpxp & imxvpu,
# Actually, they need to be applied to all SoC, including mx6sll & mx8.
SRC_URI_append_mx6sll = "${GST_IMX_PATCHES}"
SRC_URI_append_mx8 = "${GST_IMX_PATCHES}"

SRC_URI_append = " file://0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch \
                   file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
                   file://0003-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
                   file://0004-handle-audio-video-decoder-error.patch \
                   file://0005-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch \
                   file://0006-Disable-orc-optimization-for-lib-video-in-plugins-ba.patch \
                   file://0007-dmabuf-Make-the-allocator-sub-classable.patch \
                   file://0008-dmabuf-allocator-Add-missing-padding-in-the-class.patch \
                   file://0009-dmabuf-Add-free-function.patch \
                   file://0010-ion-DMA-Buf-allocator-based-on-ion.patch \
"


