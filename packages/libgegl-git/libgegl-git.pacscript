pkgname="libgegl-git"
gives="libgegl"
repology=("project: gegl")
pkgver="0.4.63"
arch=('amd64')
url='https://gitlab.gnome.org/GNOME/gegl'
source=("https://gitlab.gnome.org/GNOME/gegl.git")
depends=("gobject-introspection" "libgexiv2-2" "libluajit-5.1-2" "libgdk-pixbuf-2.0-0" "libcairo2")
makedepends=("libgirepository1.0-dev" "libgexiv2-dev" "libluajit-5.1-dev" "libgdk-pixbuf-2.0-dev" "libcairo2-dev")
pkgdesc="Graph-based image processing framework"
conflicts=("${gives}")
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0+')
external_connection=true

prepare() {
  cd gegl
  meson setup build --buildtype=release --prefix=/usr -Dcairo=enabled
}

build() {
  cd gegl
  ninja -C build -j"${NCPU}"
}

package() {
  cd gegl
  DESTDIR="${pkgdir}" ninja -C build install
}