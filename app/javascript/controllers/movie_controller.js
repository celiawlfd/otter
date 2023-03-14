import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie"
export default class extends Controller {
static targets = ["input", "results"]
  connect() {
  }

  // MOVIES

   fetchMovies(query) {
     fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
     //console.log(response)
       .then(response => response.json())
       .then(data => this.insertMovies(data))
   }
   insertMovies(data) {
     data.Search.forEach((result) => {
       const movieTag = `<div class="culturale-card" style="width: 100%, height: 100%; background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.8)), url('${result.Poster}, crop: :fill %>')">
       <div>
         <div class="d-flex align-items-center card-stickers">
           <small class="card-categorie" style="background-color: rgba(255, 187, 43, 0.8); border: 1px solid rgb(255, 187, 43)">Movie</small>
         </div>
         <p class="card-titre"> ${result.Title}</p>
         </div>
       </div>`
       this.resultsTarget.insertAdjacentHTML("beforeend", movieTag)
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
      console.log(result);

      const bookTag = `<div class="culturale-card" style="width: 100%, height: 100%; background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.8)), url('${result.volumeInfo.imageLinks.thumbnail}, crop: :fill %>')">
      <div>
        <div class="d-flex align-items-center card-stickers">
          <small class="card-categorie" style="background-color: rgba(205, 76, 236, 0.8); border: 1px solid rgb(205, 76, 236)">Book</small>
        </div>
        <p class="card-titre"> ${result.volumeInfo.title}</p>
        </div>
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
        'Authorization' : 'Bearer BQB1mGGBvrWMTmlH827YOek3pJshhP3_SSlaFTB_LvhUix5q2kPXGqiU_AiT0n511aN3LBTXbjaGRwvWarbiO5GuH1rMx7UiruX8Oj6LfMDrOUajB0vgvGX54b1y_-AWgDzxfQKVVvysuI0htHH0iekW_AytTRh6LoNxltqEZ3Pv'
      }
    })
      .then(response => response.json())
      .then(data => this.insertPodcasts(data))
  }

  insertPodcasts(data) {
    data["shows"]["items"].forEach((result) => {

      const podcastTag = `<div class="culturale-card" style="width: 100%, height: 100%; background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.8)), url(${result["images"][0]["url"]})">
      <div>
        <div class="d-flex align-items-center card-stickers">
          <small class="card-categorie" style="background-color: rgba(95, 227, 88, 0.8); border: 1px solid rgb(95, 227, 88)">Podcast</small>
        </div>
        <p class="card-titre"> ${result.name}</p>
        </div>
      </div>`
      this.resultsTarget.insertAdjacentHTML("beforeend", podcastTag)
    })
  }





  Search(event) {
    console.log(this.event)
    event.preventDefault()
    this.resultsTarget.innerHTML = ""
    this.fetchMovies(this.inputTarget.value)
    this.fetchBooks(this.inputTarget.value)
    this.fetchPodcasts(this.inputTarget.value)
  }
}
