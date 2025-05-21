pkgname="libbabl-git"
gives="libbabl"
repology=("project: babl")
pkgver="0.1.115"
arch=('amd64')
url='https://gitlab.gnome.org/GNOME/babl'
source=("https://gitlab.gnome.org/GNOME/babl.git")
pkgdesc="Pixel encoding and color space conversion engine"
conflicts=("${gives}")
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0+')

prepare() {
  cd babl
  meson setup build --buildtype=release --prefix=/usr
}

build() {
  cd babl
  ninja -C build -j"${NCPU}"
}

package() {
  cd babl
  DESTDIR="${pkgdir}" ninja -C build install
}