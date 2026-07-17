let $doc := db:get("mondial")

for $prov in $doc//province[@country = "CDN"]

let $capitalId := string($prov/@capital)
let $capital := $doc//city[@id = $capitalId]
let $cityName := $capital/name[last()]
let $population := $capital/population[last()]

where exists($capital/located_at[@watertype = "river"])

return
<Capital>
    <Province>{string($prov/name[last()])}</Province>
    <City>{string($cityName)}</City>
    <Population>{string($population)}</Population>
</Capital>