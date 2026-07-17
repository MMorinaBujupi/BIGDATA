(: XPATH 1: Liqenet me thellesine maksimale qe shtrihen ne Ballkan. :)

db:get("mondial")//lake[
  some $code in tokenize(normalize-space(string(@country)), "\s+")
  satisfies $code = ("AL", "BIH", "BG", "HR", "GR", "KOS", "MNE", "MK", "RO", "SRB", "SLO", "TR")
][depth castable as xs:double]
[
  xs:double(depth) =
  max(
    db:get("mondial")//lake[
      some $code in tokenize(normalize-space(string(@country)), "\s+")
      satisfies $code = ("AL", "BIH", "BG", "HR", "GR", "KOS", "MNE", "MK", "RO", "SRB", "SLO", "TR")
    ][depth castable as xs:double]/depth ! xs:double(.)
  )
]
