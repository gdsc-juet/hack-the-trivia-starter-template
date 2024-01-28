const API_KEY = "api_key=35f5e77c6f4deaf531ee2c27fff40aea";
const BASE_URL = "https://api.themoviedb.org/3";
const SEARCH_URL = BASE_URL + '/discover/tv?sort_by=popularity.desc&'+API_KEY;
const IMAGE_URL = 'https://image.tmdb.org/t/p/w500';

const genres = [
    {
       "id":10759,
       "name":"Action & Adventure"
    },
    {
       "id":16,
       "name":"Animation"
    },
    {
       "id":35,
       "name":"Comedy"
    },
    {
       "id":80,
       "name":"Crime"
    },
    {
       "id":99,
       "name":"Documentary"
    },
    {
       "id":18,
       "name":"Drama"
    },
    {
       "id":10751,
       "name":"Family"
    },
    {
       "id":10762,
       "name":"Kids"
    },
    {
       "id":9648,
       "name":"Mystery"
    },
    {
       "id":10763,
       "name":"News"
    },
    {
       "id":10764,
       "name":"Reality"
    },
    {
       "id":10765,
       "name":"Sci-Fi & Fantasy"
    },
    {
       "id":10766,
       "name":"Soap"
    },
    {
       "id":10767,
       "name":"Talk"
    },
    {
       "id":10768,
       "name":"War & Politics"
    },
    {
       "id":37,
       "name":"Western"
    }
 ]

const main1 = document.getElementById('template-news');
const tagEl = document.getElementById('tags');
const prev = document.getElementById('Prev');
const current = document.getElementById('Current');
const next = document.getElementById('Next');

var currentPage = 1;
var nextPage =2;
var prevPage = 3;
var lastUrl = ''
var totalPages = 100;

var selectedGenre = []
setGenre();
function setGenre(){
    tagEl.innerHTML='';
    //Dynmaically creating tags
    genres.forEach(genre =>{
        const temp = document.createElement('div');
        temp.classList.add('tag');
        temp.id=genre.id;
        temp.innerText = genre.name;
        temp.addEventListener('click',()=>{
            //saving this clicked event  
            if(selectedGenre.length == 0){
                selectedGenre.push(genre.id);
            }else{
                if(selectedGenre.includes(genre.id)){
                    selectedGenre.forEach((id,index) => {
                        if(id == genre.id){
                            selectedGenre.splice(index,1);
                        }
                    })
                }else{
                    selectedGenre.push(genre.id);
                }
            }
            console.log(selectedGenre)
              
            getMovie(SEARCH_URL + '&with_genres='+encodeURI(selectedGenre.join(',')))
            highlight()

        })
        tagEl.append(temp);
    })
}

function highlight(){
    const tags = document.querySelectorAll('.tag');
    tags.forEach(tag => {
        tag.classList.remove('highlight')
    } )
    if(selectedGenre!=0)
    {
        selectedGenre.forEach(id => {
            const highlightedTag = document.getElementById(id);
            highlightedTag.classList.add('highlight');
        })
    }
}

getMovie(SEARCH_URL);

function getMovie(url)
{
    lastUrl = url;
    fetch(url).then(res => res.json()).then(data =>{
        
        console.log(data);
        if(data.results.length !=0 ){
        bindData(data.results);
        currentPage = data.page;
        nextPage =currentPage+1;
        prevPage = currentPage-1;
        totalPages = data.total_pages;

        current.innerText = currentPage
        if(currentPage <= 1){
            prev.classList.add('disabled');
            next.classList.remove('disabled');
        }else if(currentPage>= totalPages){
            prev.classList.remove('disabled');
            next.classList.add('disabled');
        }else{
            prev.classList.remove('disabled');
            next.classList.remove('disabled');
        }

        //scroll up after page change
        tagEl.scrollIntoView({behavior : 'smooth'});

        }else{
            main1.innerHTML = `<h1> No results Found </h1>`
        }
    })
}

function bindData(data){
    main1.innerHTML = '';
    data.forEach(movie =>{
        const {title,poster_path,vote_average
            ,overview} = movie; 
       const movielist= document.createElement('div')
       movielist.classList.add('movie')
       movielist.innerHTML = `
       <div class="card-header">
       <img src="${poster_path?IMAGE_URL+poster_path:"https://previews.123rf.com/images/lightwise/lightwise1709/lightwise170900097/86893299-404-error-page-not-found-concept-and-a-broken-or-dead-link-symbol-as-a-kitten-cat-emerging-from-a.jpg"}" alt="cat" id="news-img">          
     </div>
     <div class="card-content">
     <h3 id="news-title">${title}</h3>
     <div class="title-source">
       <h6 id="${getcolor(vote_average)}">${vote_average}</h6>
       </div>
       <div class="overview">
       <p id="short">${overview}</p>
       </div>
     </div>
     ` 

     main1.appendChild(movielist);
    })
}

function getcolor(vote)
{
    if(vote>=8){
        return 'news-source'
    }else if(vote>=5){
        return 'orange'
    }else{
        return 'red'
    }

}

//previous page
prev.addEventListener('click',() =>{
    if(prevPage > 0){
        pageCall(prevPage);
    }
})

// next page setup
next.addEventListener('click',() =>{
    if(nextPage <= totalPages){
        pageCall(nextPage);
    }
})

function pageCall(page){
    let urlSplit = lastUrl.split('?'    );
    let queryParams = urlSplit[1].split('&');
    let key = queryParams[queryParams.length - 1].split('=');
    if(key[0] != 'page')
    {
        let url = lastUrl + '&page='+page
        getMovie(url);
    }else{
        key[1] = page.toString();
        //Restrcturing link again
        let a = key.join('=');
        queryParams[queryParams.length - 1] = a;
        let b = queryParams.join('&');
        let url = urlSplit[0] + '?' + b;
        getMovie(url);
    }
}