*Metacello-GsCypress-MC
loadUsing: aLoader packageManager: aPackageManager
  | required |
  required := self resolveToLoadableSpec.
  required loader: aLoader.
  ^ required load
