pkgname="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.14.2-061402-generic"
pkgver="6.14.2"
buildver="6.14.2-061402.202504101348"
arch=('arm64' 'amd64')
sha256sums_arm64=("1e5fb3f7b9a0f6d9974a579638db635f63b632e5c6677363b6fdc172dcc3f60c")
sha256sums_amd64=("1f27edb6f06384a7cb7a3c85fcb35c1f55823a1d6ae3a2e7e8522557c43c8b10")
source=("https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb")
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
pacdeps=("linux-headers-generic-stable-deb" "linux-modules-stable-deb")
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: linux" "repo: distrowatch")
