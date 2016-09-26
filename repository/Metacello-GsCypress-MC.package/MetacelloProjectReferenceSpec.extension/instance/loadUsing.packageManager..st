*Metacello-GsCypress-MC
loadUsing: aLoader packageManager: ignored
  | required |
  required := self resolveToLoadableSpec.
  required loader: aLoader.
  ^ required load