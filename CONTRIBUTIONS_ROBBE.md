## private host forwarding

files:

- AuthSessionHandler
- VelocityConfiguration
- ConnectedPlayer

Een feature / toml optie geïmplementeerd dat basically private link ondersteunt. Als deze feature config op true staat:
stel velocity bind aan address host appel.peer.banaan.com, dan gaat de backend connectie geen host zoeken in de toml
file om mee te verbinden, maar gaat die de host nemen van de proxy, 'private' tussen steken en daarmee verbinden.
De [servers] sectie in de toml worden dus genegeerd! De backend connectie gebeurt dan naar
appel.private.peer.banaan.com.
Dus een DNS server hosten onder zone peer.banaan.com waar elke A record point naar de public IP van de proxy, dan met
privatelink door verbinden. Op deze manier DNS resolutie van de container app environment gebruiken en elke server
makkelijk een custom domain geven.

## added ping-passthrough PASSTHROUGH mode

Zorgt er voor dat die default ping response van velocity niet wordt terug gestuurd, ofwel returnt de backend server een
ping response ofwel helemaal niks. Komt basically neer op het gooien van een exception op de juiste plaats.

files:
- ServerListPingHandler