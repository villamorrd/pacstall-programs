pkgname="libgegl-git"
gives="libgegl"
repology=("project: gegl")
pkgver="0.4.63"
arch=('amd64')
url='https://gitlab.gnome.org/GNOME/gegl'
source=("https://gitlab.gnome.org/GNOME/gegl.git")
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