import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie"
export default class extends Controller {
static targets = ["input", "results"]
  connect() {
  }

  //MOVIES

   fetchMovies(query) {
     fetch(`https://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
       .then(response => response.json())
       .then(data => this.insertMovies(data))
   }
   insertMovies(data) {
    data.Search.forEach((result) => {

    fetch(`https://www.omdbapi.com/?i=${result.imdbID}&plot=full&apikey=adf1f2d7`)
      .then(response => response.json())
      .then(data => {const plot = data.Plot
        const movieTag = `

        <div>
          <form class="simple_form new_movie" id="${result.imdbID}" novalidate="novalidate" action="/movies" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="b9brpM_3fEkQR9iRK2tkBKsOslAu0LrhAY8VYAnlFB5XjAlI_kujodjFrwnkrgIaRsHk8iveDfe8zQK3V2pu9Q" autocomplete="off" />
            <div class="mb-3 movie_title"><input class="form-control" type="hidden" name="movie[title]" id="movie_title" value="${result.Title}"/></div>
            <div class="mb-3 movie_description"><textarea class="form-control" style="display:none;" name="movie[description]" id="movie_description" >${plot}</textarea></div>
            <div class="mb-3 movie_year"><input class="form-control" type="hidden" step="1" name="movie[year]" id="movie_year" value="${result.Year}"/></div>
            <div class="mb-3 movie_photo_url"><input class="form-control" type="hidden" name="movie[photo_url]" id="movie_photo_url" value="${result.Poster}"/></div>
          </form>


          <button type="submit" form="${result.imdbID}" class="card-btn">
            <div class="culturale-card" style="width: 100%, height: 100%; background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.8)), url('${result.Poster}, crop: :fill')">
            <div>
              <div class="d-flex align-items-center card-stickers">
                <small class="card-categorie" style="background-color: rgba(255, 187, 43, 0.8); border: 1px solid rgb(255, 187, 43)">Movie</small>
              </div>
              <p class="card-titre"> ${result.Title}</p>
              </div>
            </div>
          </button>
        </div>`

           this.resultsTarget.insertAdjacentHTML("beforeend", movieTag)
      })


     })
   }




  // // BOOKS

  fetchBooks(query) {
    fetch(`https://www.googleapis.com/books/v1/volumes?q=${query}`)
      .then(response => response.json())
      .then(data => this.insertBooks(data))
  }

  insertBooks(data) {

    data["items"].forEach((result) => {

      const bookTag = `
      <div>
        <form class="simple_form new_book" id="${result.id}" novalidate="novalidate" action="/books" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="b9brpM_3fEkQR9iRK2tkBKsOslAu0LrhAY8VYAnlFB5XjAlI_kujodjFrwnkrgIaRsHk8iveDfe8zQK3V2pu9Q" autocomplete="off" />
          <div class="mb-3 book_title"><input class="form-control" type="hidden" name="book[title]" id="book_title" value="${result.volumeInfo.title}"/></div>
          <div class="mb-3 book_description"><textarea class="form-control" style="display:none;" name="book[description]" id="book_description" >${result.volumeInfo.description}</textarea></div>
          <div class="mb-3 book_author"><input class="form-control" type="hidden" name="book[author]" id="book_author" value="${result.volumeInfo.authors[0]}"/></div>
          <div class="mb-3 book_pages_number"><input class="form-control" type="hidden" name="book[pages_number]" id="book_pages_number" value="${result.volumeInfo.pageCount}"/></div>
          <div class="mb-3 book_year"><input class="form-control" type="hidden" step="1" name="book[year]" id="book_year" value="${result.volumeInfo.publishedDate}"/></div>
          <div class="mb-3 book_photo_url"><input class="form-control" type="hidden" name="book[photo_url]" id="book_photo_url" value="${result.volumeInfo.imageLinks.thumbnail}"/></div>
          <div class="text-center">
          </div>
        </form>

        <button type="submit" form="${result.id}" class="card-btn">
          <div class="culturale-card" style="width: 100%, height: 100%; background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.8)), url('${result.volumeInfo.imageLinks.thumbnail}, crop: :fill')">
            <div>
              <div class="d-flex align-items-center card-stickers">
                <small class="card-categorie" style="background-color: rgba(205, 76, 236, 0.8); border: 1px solid rgb(205, 76, 236)">Book</small>
              </div>
              <p class="card-titre"> ${result.volumeInfo.title}</p>
            </div>
          </div>
        </button>
      </div>`
      this.resultsTarget.insertAdjacentHTML("beforeend", bookTag)
    })
  }


  //PODCAST
  fetchPodcasts(query) {
    fetch(`https://api.spotify.com/v1/search?q=${query}&type=show&market=BE`, {
      headers : {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer BQDepC5Ejb0FO-_LtvUqx5CkkxGjZveztsUmZPTl2MsdMxhhTkTj4OByCv4WZfZzu3M17rgx6GRdMG3rlUSNRIcsEU9ik2Yrw-Pf2k9jhIeMcvOL4UTK'
      }
    })
      .then(response => response.json())
      .then(data => this.insertPodcasts(data))
  }

  insertPodcasts(data) {
    data["shows"]["items"].forEach((result) => {
    const podcastTag = `

    <div>
      <form class="simple_form new_podcast" id="${result.id}" novalidate="novalidate" action="/podcasts" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="b9brpM_3fEkQR9iRK2tkBKsOslAu0LrhAY8VYAnlFB5XjAlI_kujodjFrwnkrgIaRsHk8iveDfe8zQK3V2pu9Q" autocomplete="off" />
        <div class="mb-3 podcast_title"><input class="form-control" type="hidden" name="podcast[title]" id="podcast_title" value="${result.name}"/></div>
        <div class="mb-3 podcast_description"><textarea class="form-control" style="display:none;" name="podcast[description]" id="podcast_description" >${result.description}</textarea></div>
        <div class="mb-3 podcast_author"><input class="form-control" type="hidden" name="podcast[link]" id="podcast_link" value="${result.href}"/></div>
        <div class="mb-3 podcast_episode_count"><input class="form-control" type="hidden" name="podcast[episode_count]" id="podcast_episode_count" value="${result.total_episodes}"/></div>
        <div class="mb-3 podcast_publisher"><input class="form-control" type="hidden" step="1" name="podcast[publisher]" id="podcast_publisher" value="${result.publisher}"/></div>
        <div class="mb-3 podcast_photo_url"><input class="form-control" type="hidden" name="podcast[photo_url]" id="podcast_photo_url" value="${result["images"][0]["url"]}"/></div>
      </form>

      <button type="submit" form="${result.id}" class="card-btn">
        <div class="culturale-card" style="width: 100%, height: 100%; background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.8)), url(${result["images"][0]["url"]})">
          <div>
            <div class="d-flex align-items-center card-stickers">
              <small class="card-categorie" style="background-color: rgba(95, 227, 88, 0.8); border: 1px solid rgb(95, 227, 88)">Podcast</small>
            </div>
            <p class="card-titre"> ${result.name}</p>
            </div>
        </div>
      </button>
    </div>`
      this.resultsTarget.insertAdjacentHTML("beforeend", podcastTag)
    })
  }


  Search(event) {
    event.preventDefault()
    this.resultsTarget.innerHTML = ""
    this.fetchMovies(this.inputTarget.value)
    this.fetchBooks(this.inputTarget.value)
    this.fetchPodcasts(this.inputTarget.value)

  }
}
