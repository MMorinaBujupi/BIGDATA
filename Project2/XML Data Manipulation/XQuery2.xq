let $doc := db:get("mondial")

let $balkan :=
("AL","BIH","SRB","MNE","MK","KOS")

let $lakes :=
for $lake in $doc//lake
where
    some $c in tokenize(normalize-space($lake/@country), "\s+")
    satisfies $c = $balkan
return $lake

let $maxDepth :=
max(
for $l in $lakes
return xs:decimal($l/depth)
)

for $l in $lakes
where xs:decimal($l/depth) = $maxDepth

return
<Lake>
    <Name>{string($l/name[last()])}</Name>
    <Depth>{string($l/depth)}</Depth>
    <Countries>{string($l/@country)}</Countries>
</Lake>