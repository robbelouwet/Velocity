##  private host forwarding
files:
- AuthSessionHandler
- VelocityConfiguration
- ConnectedPlayer

Een feature / toml optie geïmplementeerd dat basically private link ondersteunt. Als deze feature config op true staat: stel velocity bind aan address host appel.peer.banaan.com, dan gaat de backend connectie geen host zoeken in de toml file om mee te verbinden, maar gaat die de host nemen van de proxy, 'private' tussen steken en daarmee verbinden. De [servers] sectie in de toml worden dus genegeerd! De backend connectie gebeurt dan naar appel.private.peer.banaan.com.