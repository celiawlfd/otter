import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie"
export default class extends Controller {
static targets = ["input", "results"]
  connect() {

    console.log("movies controller connected")
    console.log(this.inputTarget)
  }

  //MOVIES

   fetchMovies(query) {
     fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
     //console.log(response)
       .then(response => response.json())
       .then(data => this.insertMovies(data))
   }
   insertMovies(data) {
     data.Search.forEach((result) => {
       console.log(result);
      const movieTag =`<div class="feed-card" style="width: 100%, height: 100%; background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.8)), url('${result.Poster}, crop: :fill')">
       <div>
         <p class="card-titre">${result.Title} </p>
       </div>
     </div>`
       this.resultsTarget.insertAdjacentHTML("beforeend", movieTag)
     })
   }


  //BOOKS
  fetchBooks(query) {
    fetch(`https://www.googleapis.com/books/v1/volumes?q=${query}`)
      .then(response => response.json())
      .then(data => this.insertBooks(data))
  }

  insertBooks(data) {
    data["items"].forEach((result) => {
      console.log(result);
      const bookTag =`<div class="feed-card" style="width: 100%, height: 100%; background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.8)), url('${result.volumeInfo.imageLinks.thumbnail}, crop: :fill')">
      <div>
        <p class="card-titre">${result.volumeInfo.title} </p>
      </div>
    </div>`
      this.resultsTarget.insertAdjacentHTML("beforeend", bookTag)
    })
  }





  Search(event) {
    console.log(this.event)
    event.preventDefault()
    this.resultsTarget.innerHTML = ""
    this.fetchMovies(this.inputTarget.value)
    this.fetchBooks(this.inputTarget.value)
  }
}
