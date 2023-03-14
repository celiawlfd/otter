# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri" # GEM to parse data from web
require 'rspotify'

url_movies = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url_movies).read)

Movie.destroy_all
puts "creating movies"

movies["results"].each do |movie|
  movie = Movie.new(
    title: movie['original_title'],
    description: movie['overview'],
    photo_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}",
    year: movie['release_date']
  )
  movie.save!

  puts "creating movie #{movie.id}, #{movie.title}"
end

Book.destroy_all
puts "Creating Books"

url_books = "https://www.googleapis.com/books/v1/users/106574273445809316735/bookshelves/0/volumes/?maxResults=40&key=AIzaSyDyW21hCshvMzC8eV_DQVO1ehDO5p5XoNk"
books = JSON.parse(URI.open(url_books).read)


books["items"].each do |book|
  if book["volumeInfo"]["imageLinks"]
    book = Book.new(
      title: book["volumeInfo"]['title'],
      author: book["volumeInfo"]['authors'],
      description: book["volumeInfo"]['description'],
      photo_url: book["volumeInfo"]["imageLinks"]["thumbnail"],
      year: book["volumeInfo"]['publishedDate'],
      pages_number: book["volumeInfo"]['pageCount']
    )
    book.save
    puts "creating book #{book.id}, #{book.title}"
  end
end

puts "done"


url = 'https://api.spotify.com/v1/search?q=table&type=show&market=BE'
headers = {
  'Accept' => 'application/json',
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer BQC1GfNfLbcoqW7U-q_uT2_EcMAqdyKX3g-pSimyyqSV5RwgmG5XJ_E37BXcHhoa5Sbd3mJ8JPUn_p9hOwLAKRdGzTX2pvfgQDgVi4CLcTnAJ_qQIN56zro3_QYASCNdugLWbs6HXjNqhXkcweupmjhsfp4NEnLxCaySn8yz6dVw'

}

response = URI.open(url, headers).read
podcasts = JSON.parse(response)

Podcast.destroy_all
puts "Creating Podcasts"


podcasts["shows"]["items"].each do |podcast|
  podcast = Podcast.new(
    title: podcast["name"],
    publisher: podcast["publisher"],
    description: podcast["description"],
    photo_url: podcast["images"].first["url"],
    episode_count: podcast["total_episodes"],
    link: podcast["external_urls"]["spotify"]
  )
  podcast.save
  puts "creating podcast #{podcast.id}, #{podcast.title}"
end
puts "done"

url_environment = 'https://api.spotify.com/v1/search?q=environment&type=show&market=BE'
response = URI.open(url_environment, headers).read
podcasts = JSON.parse(response)

podcasts["shows"]["items"].each do |podcast|
  podcast = Podcast.new(
    title: podcast["name"],
    publisher: podcast["publisher"],
    description: podcast["description"],
    photo_url: podcast["images"].first["url"],
    episode_count: podcast["total_episodes"],
    link: podcast["external_urls"]["spotify"]
  )
  podcast.save
  puts "creating podcast #{podcast.id}, #{podcast.title}"
end
puts "done"

url_startup = 'https://api.spotify.com/v1/search?q=startup&type=show&market=BE'
response = URI.open(url_startup, headers).read
podcasts = JSON.parse(response)

podcasts["shows"]["items"].each do |podcast|
  podcast = Podcast.new(
    title: podcast["name"],
    publisher: podcast["publisher"],
    description: podcast["description"],
    photo_url: podcast["images"].first["url"],
    episode_count: podcast["total_episodes"],
    link: podcast["external_urls"]["spotify"]
  )
  podcast.save
  puts "creating podcast #{podcast.id}, #{podcast.title}"
end
puts "done"


Podcast.create(
  title: "Docteur en psychologie de l'enfant",
  publisher: "Caroline Goldman",
  description: "Caroline Goldman est psychologue pour enfants et adolescents. Elle exerce son métier avec passion depuis une vingtaine d'années. Elle est titulaire d'un doctorat en psychologie de l'enfant, a enseigné 15 ans à l'université et a également publié des livres.
  Ce podcast s'inscrit dans une démarche d'information et de prévention en santé mentale de l'enfant.
  Il a deux objectifs :
  1. Aborder les dimensions éducatives fondamentales : apprendre aux enfants à gérer la frustration à partir de l'âge d'un an, donner à son enfant confiance en lui, annoncer des mauvaises nouvelles, parler des dangers d'internet...
  2. Faire le point sur certaines contre-vérités médiatiques qui ont un effet sur la santé des enfants : le haut potentiel intellectuel, l'hypersensibilité, l'éducation positive bienveillante.
  Bonne écoute !",
  photo_url: "https://image.ausha.co/Oksouk07ps3r0EVtx4xQUMWqFXx9CAfpF72Q8nn4_1400x1400.jpeg?t=1647512072"
)
Podcast.create(
  title: "Chez nous, avec Océane Andréa",
  publisher: "Océane Andréa",
  description: "Chez nous, avec Océane Andréa. Le podcast pour se sentir à la maison, peu importe où, avec le confort de ses écouteurs. Le but : parler de sujets divers chaque semaine. Grandir avec chaque épisodes.
  P.S: j’ai 21 ans donc je dis des gros mots de temps en temps désolé si ça dérange certains but that’s who I am :)
  P.S 2: comme vous venez de le voir je fais du franglais depuis toujours comme j’ai grandit étant bilingue. Encore une fois désolé si ça dérange certains mais c’est naturel chez moi (pour ceux qui ♡ il y a mes passages full en anglais à la fin des épisodes)
  Love, Océ",
  photo_url: "https://cdns-images.dzcdn.net/images/talk/3e9403e4b2e08ec9250fbe97245443d9/1000x1000.jpg"
)
Podcast.create(
  title: "Cami's hotline",
  publisher: "mimabycami",
  description: "Cami's Hotline, c'est l’appel que tu passes à ta copine quand tu as besoin de parler, quand tu veux être rassuré.e, conseillé.e ou même challengé.e.
  On parle de sujets intimes, sociétaux, des petits riens et des grands touts, dans la bienveillance la plus totale.
  Pose-moi tes questions sur Instagram : @mimabycami ou dans les commentaires sur Apple Podcast.",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8af6335a617614d855604bc9c2"
)
Podcast.create(
  title: "Emotions",
  publisher: "Louie Media",
  description: "Pour comprendre pourquoi vous ressentez ce que vous ressentez, et d'où viennent les émotions que vous éprouvez. Un lundi sur deux, plongez dans votre jungle intérieure, et apprenez à mieux y naviguer grâce à des expert(e)s et des histoires. Un podcast produit par Louie Media.",
  photo_url: "http://static1.squarespace.com/static/5a8f53d83917ee32087ce6fb/5c2c9abb4fa51a03a8b1a066/60804229e441d00e3068dbca/1622107558878/logo_Emotions_Acast.jpg?format=1500w"
)
Podcast.create(
  title: "Canapé Six Places",
  publisher: "Spotify Studios",
  description: "Prendre le temps, s’arrêter sur les détails, revenir sur des anecdotes… Je m'appelle Lena Mahfouf mais sur internet tout le monde m'appelle Lena Situations. Ce podcast c’est ma safe place, un podcast où je parle de ce qui me passe par la tête en petit comité, seule ou avec des invité·es.
  Canapé 6 places est un podcast Original Spotify, imaginé et incarné par Lena Situations et produit par Spotify Studios. ",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a0113f3add4823797c2a97d1a"
)
Podcast.create(
  title: "Home(icides)",
  publisher: "Bababam",
  description: "Dans ce programme, vous découvrirez les récits de drames familiaux meurtriers qui ont marqué et qui marquent encore aujourd’hui les esprits. De la tuerie de Chevaline, à l’affaire Romand, en passant par le meurtre de la petite JonBénet Ramsey aux Etats-Unis… On vous raconte ces histoires au dénouement inimaginable… A découvrir comme un feuilleton.
  ",
  photo_url: "https://megaphone.imgix.net/podcasts/11c8690e-8365-11ec-ae96-ebc871654dfa/image/1640250779767-b82c9e247c495cb13260d91191fa29bf.jpeg?ixlib=rails-4.3.1&max-w=3000&max-h=3000&fit=crop&auto=format,compress"
)
Podcast.create(
  title: "En Mode Coloc",
  publisher: "Lou-ann Poy",
  description: "Bienvenue dans notre colocation hebdomadaire :) Tous les lundis, 9h, on va beaucoup parler, de nos souffrances, de nos moments heureux, mais le but c’est d’après avoir écouter ces épisodes c’est de se sentir un peu mieux ou d’avoir répondu à quelques questions sur soi même. Vu qu'on est tous colocataires, on à tous les clés de ce podcast !",
  photo_url: "https://cdns-images.dzcdn.net/images/talk/b50723801bcc1398ef23a7164a8152e0/1000x1000.jpg"
)
Podcast.create(
  title: "Sans Permission",
  publisher: "Yomi & Oussama",
  description: "Bienvenue sur notre podcast 'Sans Permission' !
  Régulièrement, on se retrouvera pour échanger nos points de vue sur le monde du business en général, de l'entrepreneuriat et partager nos expériences personnelles. ",
  photo_url: "https://image.ausha.co/BvMqeStnuyQnJdPqLaCb8C6qACu8PP7R7yAB3c7g_1400x1400.jpeg?t=1647015607"
)
Podcast.create(
  title: "Glow Up",
  publisher: "Marie Drew",
  description: "J'ai créer Glow Up car j'avais envie de te transmettre toutes ces clés qui me paraissent indispensable dans la vie pour réaliser ce que tu as toujours voulu faire et devenir la meilleure version de toi-même.",
  photo_url: "https://uploads.podcloud.fr/uploads/covers/c04a/69c1/ca91/867e/319c/3ef8/3646/8322/3133/d11f/medium_c04a69c1ca91867e319c3ef8364683223133d11f.jpg?version=1606493457&"
)
Podcast.create(
  title: "Neurosapiens",
  publisher: "Anaïs Roux",
  description: "LE podcast pour votre cerveau !
  Plongez au coeur du fonctionnement de votre cerveau. Un mercredi sur deux, découvrez les secrets de votre outil le plus précieux, apprenez comment il vous accompagne au quotidien et comment il peut, parfois, vous tromper. Ce podcast se veut léger, décomplexé et compréhensible par tous à travers des sujets ancrés dans la vie quotidienne. Découvrez ce qu’il se trame dans votre cerveau lorsque vous avez un mot sur le bout de la langue, lorsque vous tombez amoureux, lorsque vous avez “déjà-vu” cette scène ou encore lorsque vous croyez en Dieu.
  Une question ? Un thème du quotidien que vous aimeriez voir sous le prisme des neurosciences ? ",
  photo_url: "https://image.ausha.co/o1qescf8lQ2bNXSJ7Ank2y5WcOOkDWzMYFckWSLM_1400x1400.jpeg?t=1616260486"
)
Podcast.create(
  title: "Nota Bene",
  publisher: "Benjamin Brillaud",
  description: "Nota Bene, c'est une autre façon de découvrir l'Histoire de France et du monde ! L'Histoire est sociale, économique, scientifique, politique, elle touche à tous les domaines. A travers des émissions thématiques et des entretiens avec des historiens, archéologues et chercheurs, voyagez de l'Antiquité à nos jours et redécouvrez la richesse de cette Histoire ! ",
  photo_url: "https://s3.amazonaws.com/assets.pippa.io/shows/undefined/1624279183842-c470299a2077ec8dc410bb063286e016.jpeg"
)
Podcast.create(
  title: "Le Coeur sur la table",
  publisher: "Binge Audio",
  description: "Parce que s’aimer est l’une des façons de faire la révolution. Une fois par semaine, un épisode pour réinventer nos relations amoureuses, nos liens avec nos ami·e·s, nos parent·e·s et nos amant·e·s. Le Coeur sur la table est le nouveau podcast de Victoire Tuaillon produit par Binge Audio.",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a93ae6c33afc3645ae5100602"
)
Podcast.create(
  title: "EX...",
  publisher: "Agathe Lecaron",
  description: "Dans ce podcast produit par Agathe Lecaron, vous trouverez des témoignages d'anonymes qui ont vécu des histoires d'amour qui ont tout changé dans leurs vies : ils ont vibré, parfois énormément souffert, il ont été déçus, parfois trahis, ont vécu des passions destructrices ou au contraire fondatrices, mais quoiqu'il en soit, même si ce ne sont pas que des histoires d'ex..., elles sont ex...traordinaires.",
  photo_url: "https://i.scdn.co/image/4620ee060a3cda92b68b6702a2e6d0dc888e1188"
)
Podcast.create(
  title: "J'ai peur, donc j'y vais",
  publisher: "Stef Bluelips",
  description: "J'ai peur, donc j'y vais, c'est LE podcast pour vous aider à oser !
  Un jeudi sur deux, Stef Bluelips, coach professionnel, partage des conseils et des outils pour vous aider à donner un nouvel élan à votre vie. ",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a2afcf596fdd4b5c490af5a1b"
)
Podcast.create(
  title: "Bastos Motivation",
  publisher: "Bastos Grimal",
  description: "J’invite des personnes qui m’inspirent et on essaie de vous donner des clés pour etre la meilleure version de vous memes.",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a63c8e1c47674bfce1b3dcc20"
)
Podcast.create(
  title: "Anything Goes",
  publisher: "Emma Chamberlain",
  description: "Emma prefers to share her thoughts with a microphone rather than a physical human being, so thank god she has a podcast. Recorded from the comfort of her bed...and some other fun places, Emma talks at length about whatever is on her mind every week. Anything really does go on this podcast. Sometimes philosophy, sometimes a random story from 10 years ago, sometimes advice, sometimes fun interviews, and sometimes nothing at all. You never know what you are going to get, but that’s what keeps it interesting. New episodes every Thursday and Sunday, only on Spotify.",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a3e06c4e6fdfbb6d8d10a9c16"
)
