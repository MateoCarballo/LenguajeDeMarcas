<provinciaMillon>
{for $i in doc("provincias.xml")//provincia
order by $i/number(numHAB) descending
where $i/numHAB>1000000
return 
<provincia>
<codPRO>{data($i/@codPRO)}</codPRO>
<nomPRO>{data($i/nomPRO)}</nomPRO>
<numHAB>{data($i/numHAB)}</numHAB>
</provincia>
}
</provinciaMillon>


