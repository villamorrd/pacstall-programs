pkgname="gimp-git"
gives="gimp"
repology=("project: ${pkgname}")
arch=('amd64')
pkgver="3.0.2"
source=("https://gitlab.gnome.org/GNOME/gimp.git")
depends=(
  "libgegl-0.4-0t64" "libbabl-0.1-0" "zlib1g" "bzip2" "liblzma5"
  "libgexiv2-2" "libpng16-16t64" "libjpeg8" "libtiff6" "librsvg2-2"
  "liblcms2-2" "libpoppler-glib8t64" "poppler-data" "libmypaint-1.5-1" "gvfs"
  "gobject-introspection" "libappstream-glib8"
)
makedepends=(
  "pkg-config" "gettext" "libgegl-dev" "libbabl-dev" "libgtk-3-dev"
  "libcairo2-dev" "libpango1.0-dev" "zlib1g-dev" "libbz2-dev" "liblzma-dev"
  "libgexiv2-dev" "libpng-dev" "libjpeg-dev" "libtiff-dev" "librsvg2-dev"
  "liblcms2-dev" "libpoppler-glib-dev" "libmypaint-dev" "mypaint-brushes"
  "libgirepository1.0-dev" "libappstream-glib-dev" "xsltproc"
)
optdepends=(
  "libopenjp2-7: OpenJPEG support"
  "libmng2: Multiple-image Network Graphics (MNG) support"
  "libwebp7: WebP support"
  "libheif1: HEIF support"
  "libwmf0.2-7: Windows metafile (WMF) support"
  "libaa1: ASCII art library"
  "libgs10: Ghostscript support"
)
pacdeps=("meson-git")
pkgdesc="GNU Image Manipulation Program"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0+')

prepare() {
  cd "${gives}"
  meson setup build --buildtype=release --prefix=/usr
}

build() {
  cd "${gives}"
  ninja -C build -j"${NCPU}"
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" ninja -C build install
}
