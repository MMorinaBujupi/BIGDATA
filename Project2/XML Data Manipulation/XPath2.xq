let $doc := db:get("mondial")

let $lakes :=
$doc//lake[
    tokenize(normalize-space(@country), "\s+") =
    ("AL","BIH","SRB","MNE","MK","KOS")
]

let $max :=
max(
for $l in $lakes
return xs:decimal($l/depth)
)

return
$lakes[xs:decimal(depth) = $max]