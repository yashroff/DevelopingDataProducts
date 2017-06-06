# Developing Data Products Asst 1
Yasneen Ashroff  
October 16, 2016  



## Crime Rates in American cities

This data was sourced from https://data.cityofnewyork.us.



```r
df
```

```
##    Year Crime.Index.Ranking         City   Rate
## 1  2009                   1     New York 2242.1
## 2  2009                   2     San Jose 2745.7
## 3  2009                   3    San Diego 2903.7
## 4  2009                   4  Los Angeles 3074.0
## 5  2009                   5    Las Vegas 4407.7
## 6  2009                   6      Phoenix 4654.3
## 7  2009                   7 Philadelphia 4849.5
## 8  2009                   8       Dallas 4407.7
## 9  2009                   9      Houston 6444.2
## 10 2009                  10  San Antonio 7241.6
```



```r
df %>% leaflet() %>% addTiles() %>% addCircles(weight=1,radius=(df$Rate)*20,popup=df$city_rate)
```

<!--html_preserve--><div id="htmlwidget-0731a32c2951a6cc473a" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-0731a32c2951a6cc473a">{"x":{"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"maxNativeZoom":null,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"continuousWorld":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":null,"unloadInvisibleTiles":null,"updateWhenIdle":null,"detectRetina":false,"reuseTiles":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap\u003c/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA\u003c/a>"}]},{"method":"addCircles","args":[[40.7128,37.3382,32.7157,34.0522,36.1699,33.4484,39.9526,32.7767,29.7604,29.4241],[-74.0059,-121.8863,-117.1611,-118.2437,-115.1398,-112.074,-75.1652,-96.797,-95.3698,-98.4936],[44842,54914,58074,61480,88154,93086,96990,88154,128884,144832],null,null,{"lineCap":null,"lineJoin":null,"clickable":true,"pointerEvents":null,"className":"","stroke":true,"color":"#03F","weight":1,"opacity":0.5,"fill":true,"fillColor":"#03F","fillOpacity":0.2,"dashArray":null},["New York 2242.1","San Jose 2745.7","San Diego 2903.7","Los Angeles 3074","Las Vegas 4407.7","Phoenix 4654.3","Philadelphia 4849.5","Dallas 4407.7","Houston 6444.2","San Antonio 7241.6"]]}],"limits":{"lat":[29.4241,40.7128],"lng":[-121.8863,-74.0059]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
