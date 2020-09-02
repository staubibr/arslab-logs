import requests
import json

endpoint = "https://www.geogratis.gc.ca/services/geolocation/en/locate"

addresses=["40 rue Renaud gatineau", "150 Tunney's Pasture", "297 rue Pierre-Lafontaine"]

data = []

for address in addresses:
    url = endpoint + "?q=" + address

    response = requests.get(url)

    if response.status_code != 200:
        raise Exception("Error while performing GET request to GeoGratis.")

    jArr = json.loads(response.content)

    if len(jArr) == 0:
        continue

    data.append(jArr[0])

with open("./result.json", 'w', encoding='utf-8') as f:
    json.dump(data, f, separators=(',', ':'), ensure_ascii=False)