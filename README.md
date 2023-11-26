# whashlist

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# API TMDB utilisation
<b>Lien vers le profil :</b> https://www.themoviedb.org/u/Lora2208

<b>API key :</b> 5dab12725eee000f48841e59fcf60567

Pour les recherches, utiliser la requete : 
GET https://api.themoviedb.org/3/search/movie?api_key=5dab12725eee000f48841e59fcf60567&query=Hunger&language=fr-FR </br>
Avec comme paramètres: </br>
<ul>
<li>query : on entre le nom du film qu'on recherche</li>
<li>language: permet de définir le langage du retour de la requete que l'on souhaite</li>
</ul>
Avec ça, on peut récupérer l'id du film qui nous servira pour d'autres requête afin de compléter les informations. </br>
Pour les détails du film :
GET https://api.themoviedb.org/3/movie/{movie_id}?api_key=5dab12725eee000f48841e59fcf60567&language=fr-FR </br>
Avec comme paramètres: </br>
<ul>
<li>movie_id: avec l'id du film que l'on peut récupérer dans la recherche du film</li>
<li>language: permet de définir le langage du retour de la requete que l'on souhaite</li>
</ul>
Pour les acteurs du films :
GET https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=5dab12725eee000f48841e59fcf60567&language=fr-FR </br>
Avec comme paramètres: </br>
<ul>
<li>movie_id: avec l'id du film que l'on peut récupérer dans la recherche du film</li>
<li>language: permet de définir le langage du retour de la requete que l'on souhaite</li>
</ul>
Pour des images supplémentaires :
GET https://api.themoviedb.org/3/movie/{movie_id}/images?api_key=5dab12725eee000f48841e59fcf60567&language=fr-FR </br>
Avec comme paramètres:
<ul>
<li>movie_id: avec l'id du film que l'on peut récupérer dans la recherche du film</li>
</ul>
Pour des mots clés :
GET https://api.themoviedb.org/3/movie/{movie_id}/keywords?api_key=5dab12725eee000f48841e59fcf60567&language=fr-FR </br>
<ul>
<li>movie_id: avec l'id du film que l'on peut récupérer dans la recherche du film</li>
</ul>
Pour des vidéos :
GET  https://example.com/3/movie/{movie_id}/videos?api_key=5dab12725eee000f48841e59fcf60567&language=fr-FR </br>
<ul>
<li>movie_id: avec l'id du film que l'on peut récupérer dans la recherche du film</li>
<li>language: permet de définir le langage du retour de la requete que l'on souhaite</li>
</ul>
Pour obtenir les sites de diffusions :
GET https://api.themoviedb.org/3/movie/{movie_id}/watch/providers?api_key=5dab12725eee000f48841e59fcf60567&language=fr-FR </br>
<ul>
<li>movie_id: avec l'id du film que l'on peut récupérer dans la recherche du film</li>
</ul>

# API Books utilisation
Pour obtenir un livre spécifique, il faut taper cette requête :
GET https://www.googleapis.com/books/v1/volumes?q=Le+Manoir&key=AIzaSyCGcSwncdebsrg9ikPuAadV94BiX7HySjc
q permet de passer en paramètre le titre d'un livre, on peut ainsi obtenir ses infos.