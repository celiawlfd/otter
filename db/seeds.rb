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
    year: movie['release_date'],
    duration: "",
    director: ""
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
  'Authorization' => 'Bearer BQAv3mUWVVk2oKeA8A4JuR98oawMKShvU67ra_idRvTqYwqCah4hvkM-XQsR5k0T5FpJVcdd7JQanHnkrXyVZ48_JNwx6wZJXOH1q7-fUMQnBBVahiUdmUvjElarYthb2QMRm9Bh5O2O0Ba6DCj1UOGV0a0bhh5AKkB3NR7A-774fNSa'

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
  description: "Caroline Goldman est psychologue pour enfants et adolescents. Elle exerce son m??tier avec passion depuis une vingtaine d'ann??es. Elle est titulaire d'un doctorat en psychologie de l'enfant, a enseign?? 15 ans ?? l'universit?? et a ??galement publi?? des livres.
  Ce podcast s'inscrit dans une d??marche d'information et de pr??vention en sant?? mentale de l'enfant.
  Il a deux objectifs :
  1. Aborder les dimensions ??ducatives fondamentales : apprendre aux enfants ?? g??rer la frustration ?? partir de l'??ge d'un an, donner ?? son enfant confiance en lui, annoncer des mauvaises nouvelles, parler des dangers d'internet...
  2. Faire le point sur certaines contre-v??rit??s m??diatiques qui ont un effet sur la sant?? des enfants : le haut potentiel intellectuel, l'hypersensibilit??, l'??ducation positive bienveillante.
  Bonne ??coute !",
  photo_url: "https://image.ausha.co/Oksouk07ps3r0EVtx4xQUMWqFXx9CAfpF72Q8nn4_1400x1400.jpeg?t=1647512072"
)
Podcast.create(
  title: "Chez nous, avec Oc??ane Andr??a",
  publisher: "Oc??ane Andr??a",
  description: "Chez nous, avec Oc??ane Andr??a. Le podcast pour se sentir ?? la maison, peu importe o??, avec le confort de ses ??couteurs. Le but : parler de sujets divers chaque semaine. Grandir avec chaque ??pisodes.
  P.S: j???ai 21 ans donc je dis des gros mots de temps en temps d??sol?? si ??a d??range certains but that???s who I am :)
  P.S 2: comme vous venez de le voir je fais du franglais depuis toujours comme j???ai grandit ??tant bilingue. Encore une fois d??sol?? si ??a d??range certains mais c???est naturel chez moi (pour ceux qui ??? il y a mes passages full en anglais ?? la fin des ??pisodes)
  Love, Oc??",
  photo_url: "https://cdns-images.dzcdn.net/images/talk/3e9403e4b2e08ec9250fbe97245443d9/1000x1000.jpg"
)
Podcast.create(
  title: "Cami's hotline",
  publisher: "mimabycami",
  description: "Cami's Hotline, c'est l???appel que tu passes ?? ta copine quand tu as besoin de parler, quand tu veux ??tre rassur??.e, conseill??.e ou m??me challeng??.e.
  On parle de sujets intimes, soci??taux, des petits riens et des grands touts, dans la bienveillance la plus totale.
  Pose-moi tes questions sur Instagram : @mimabycami ou dans les commentaires sur Apple Podcast.",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8af6335a617614d855604bc9c2"
)
Podcast.create(
  title: "Emotions",
  publisher: "Louie Media",
  description: "Pour comprendre pourquoi vous ressentez ce que vous ressentez, et d'o?? viennent les ??motions que vous ??prouvez. Un lundi sur deux, plongez dans votre jungle int??rieure, et apprenez ?? mieux y naviguer gr??ce ?? des expert(e)s et des histoires. Un podcast produit par Louie Media.",
  photo_url: "http://static1.squarespace.com/static/5a8f53d83917ee32087ce6fb/5c2c9abb4fa51a03a8b1a066/60804229e441d00e3068dbca/1622107558878/logo_Emotions_Acast.jpg?format=1500w"
)
Podcast.create(
  title: "Canap?? Six Places",
  publisher: "Spotify Studios",
  description: "Prendre le temps, s???arr??ter sur les d??tails, revenir sur des anecdotes??? Je m'appelle Lena Mahfouf mais sur internet tout le monde m'appelle Lena Situations. Ce podcast c???est ma safe place, un podcast o?? je parle de ce qui me passe par la t??te en petit comit??, seule ou avec des invit????es.
  Canap?? 6 places est un podcast Original Spotify, imagin?? et incarn?? par Lena Situations et produit par Spotify Studios. ",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a0113f3add4823797c2a97d1a"
)
Podcast.create(
  title: "Home(icides)",
  publisher: "Bababam",
  description: "Dans ce programme, vous d??couvrirez les r??cits de drames familiaux meurtriers qui ont marqu?? et qui marquent encore aujourd???hui les esprits. De la tuerie de Chevaline, ?? l???affaire Romand, en passant par le meurtre de la petite JonB??net Ramsey aux Etats-Unis??? On vous raconte ces histoires au d??nouement inimaginable??? A d??couvrir comme un feuilleton.
  ",
  photo_url: "https://megaphone.imgix.net/podcasts/11c8690e-8365-11ec-ae96-ebc871654dfa/image/1640250779767-b82c9e247c495cb13260d91191fa29bf.jpeg?ixlib=rails-4.3.1&max-w=3000&max-h=3000&fit=crop&auto=format,compress"
)
Podcast.create(
  title: "En Mode Coloc",
  publisher: "Lou-ann Poy",
  description: "Bienvenue dans notre colocation hebdomadaire :) Tous les lundis, 9h, on va beaucoup parler, de nos souffrances, de nos moments heureux, mais le but c???est d???apr??s avoir ??couter ces ??pisodes c???est de se sentir un peu mieux ou d???avoir r??pondu ?? quelques questions sur soi m??me. Vu qu'on est tous colocataires, on ?? tous les cl??s de ce podcast !",
  photo_url: "https://cdns-images.dzcdn.net/images/talk/b50723801bcc1398ef23a7164a8152e0/1000x1000.jpg"
)
Podcast.create(
  title: "Sans Permission",
  publisher: "Yomi & Oussama",
  description: "Bienvenue sur notre podcast 'Sans Permission' !
  R??guli??rement, on se retrouvera pour ??changer nos points de vue sur le monde du business en g??n??ral, de l'entrepreneuriat et partager nos exp??riences personnelles. ",
  photo_url: "https://image.ausha.co/BvMqeStnuyQnJdPqLaCb8C6qACu8PP7R7yAB3c7g_1400x1400.jpeg?t=1647015607"
)
Podcast.create(
  title: "Glow Up",
  publisher: "Marie Drew",
  description: "J'ai cr??er Glow Up car j'avais envie de te transmettre toutes ces cl??s qui me paraissent indispensable dans la vie pour r??aliser ce que tu as toujours voulu faire et devenir la meilleure version de toi-m??me.",
  photo_url: "https://uploads.podcloud.fr/uploads/covers/c04a/69c1/ca91/867e/319c/3ef8/3646/8322/3133/d11f/medium_c04a69c1ca91867e319c3ef8364683223133d11f.jpg?version=1606493457&"
)
Podcast.create(
  title: "Neurosapiens",
  publisher: "Ana??s Roux",
  description: "LE podcast pour votre cerveau !
  Plongez au coeur du fonctionnement de votre cerveau. Un mercredi sur deux, d??couvrez les secrets de votre outil le plus pr??cieux, apprenez comment il vous accompagne au quotidien et comment il peut, parfois, vous tromper. Ce podcast se veut l??ger, d??complex?? et compr??hensible par tous ?? travers des sujets ancr??s dans la vie quotidienne. D??couvrez ce qu???il se trame dans votre cerveau lorsque vous avez un mot sur le bout de la langue, lorsque vous tombez amoureux, lorsque vous avez ???d??j??-vu??? cette sc??ne ou encore lorsque vous croyez en Dieu.
  Une question ? Un th??me du quotidien que vous aimeriez voir sous le prisme des neurosciences ? ",
  photo_url: "https://image.ausha.co/o1qescf8lQ2bNXSJ7Ank2y5WcOOkDWzMYFckWSLM_1400x1400.jpeg?t=1616260486"
)
Podcast.create(
  title: "Nota Bene",
  publisher: "Benjamin Brillaud",
  description: "Nota Bene, c'est une autre fa??on de d??couvrir l'Histoire de France et du monde ! L'Histoire est sociale, ??conomique, scientifique, politique, elle touche ?? tous les domaines. A travers des ??missions th??matiques et des entretiens avec des historiens, arch??ologues et chercheurs, voyagez de l'Antiquit?? ?? nos jours et red??couvrez la richesse de cette Histoire ! ",
  photo_url: "https://s3.amazonaws.com/assets.pippa.io/shows/undefined/1624279183842-c470299a2077ec8dc410bb063286e016.jpeg"
)
Podcast.create(
  title: "Le Coeur sur la table",
  publisher: "Binge Audio",
  description: "Parce que s???aimer est l???une des fa??ons de faire la r??volution. Une fois par semaine, un ??pisode pour r??inventer nos relations amoureuses, nos liens avec nos ami??e??s, nos parent??e??s et nos amant??e??s. Le Coeur sur la table est le nouveau podcast de Victoire Tuaillon produit par Binge Audio.",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a93ae6c33afc3645ae5100602"
)
Podcast.create(
  title: "EX...",
  publisher: "Agathe Lecaron",
  description: "Dans ce podcast produit par Agathe Lecaron, vous trouverez des t??moignages d'anonymes qui ont v??cu des histoires d'amour qui ont tout chang?? dans leurs vies : ils ont vibr??, parfois ??norm??ment souffert, il ont ??t?? d????us, parfois trahis, ont v??cu des passions destructrices ou au contraire fondatrices, mais quoiqu'il en soit, m??me si ce ne sont pas que des histoires d'ex..., elles sont ex...traordinaires.",
  photo_url: "https://i.scdn.co/image/4620ee060a3cda92b68b6702a2e6d0dc888e1188"
)
Podcast.create(
  title: "J'ai peur, donc j'y vais",
  publisher: "Stef Bluelips",
  description: "J'ai peur, donc j'y vais, c'est LE podcast pour vous aider ?? oser !
  Un jeudi sur deux, Stef Bluelips, coach professionnel, partage des conseils et des outils pour vous aider ?? donner un nouvel ??lan ?? votre vie. ",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a2afcf596fdd4b5c490af5a1b"
)
Podcast.create(
  title: "Bastos Motivation",
  publisher: "Bastos Grimal",
  description: "J???invite des personnes qui m???inspirent et on essaie de vous donner des cl??s pour etre la meilleure version de vous memes.",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a63c8e1c47674bfce1b3dcc20"
)
Podcast.create(
  title: "Anything Goes",
  publisher: "Emma Chamberlain",
  description: "Emma prefers to share her thoughts with a microphone rather than a physical human being, so thank god she has a podcast. Recorded from the comfort of her bed...and some other fun places, Emma talks at length about whatever is on her mind every week. Anything really does go on this podcast. Sometimes philosophy, sometimes a random story from 10 years ago, sometimes advice, sometimes fun interviews, and sometimes nothing at all. You never know what you are going to get, but that???s what keeps it interesting. New episodes every Thursday and Sunday, only on Spotify.",
  photo_url: "https://i.scdn.co/image/ab6765630000ba8a3e06c4e6fdfbb6d8d10a9c16"
)
