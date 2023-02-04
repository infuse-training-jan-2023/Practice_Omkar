let container = document.getElementById("card-container");
let base_url = "https://pokeapi.co/api/v2/pokemon";
let offset = 0;
let all_pokemon = [];

function cardGenerator({id, name, height, weight, base_experience, stats, sprites}) {
    let card = document.createElement("div");
    card.className = "card";

    let image = document.createElement("div");
    image.className = "image";
    let img1 = document.createElement("img");
    img1.src = sprites.front_default;
    img1.alt = name;
    image.appendChild(img1);

    let data = document.createElement("div");
    data.classList = "data";
    let p1 = document.createElement("p");
    p1.innerText = "ID: " + id;
    let p2 = document.createElement("p");
    p2.innerText = "Name: " + name;
    let p3 = document.createElement("p");
    p3.innerText = "Base Exp: " + base_experience;
    let p4 = document.createElement("p");
    p4.innerText = "Height: " + height;
    let p5 = document.createElement("p");
    p5.innerText = "Weight: " + weight;
    let p6 = document.createElement("p");
    p6.innerText = "Hp: " + stats[0].base_stat;

    let p_elements = [p1, p2, p3, p4, p5, p6];
    p_elements.forEach(p => {
        data.appendChild(p);
    })

    card.appendChild(image);
    card.appendChild(data);

    let btn = document.createElement("a");
    btn.id = "b1";
    btn.innerText = "Load Data";
    btn.href = `pokemon.html?${id}`;
    btn.target = "more";
    card.appendChild(btn);

    container.appendChild(card);

    img1.addEventListener('mouseover', () => {
        img1.src = sprites.back_default;
    });

    img1.addEventListener('mouseout', () => {
        img1.src = sprites.front_default;
    });
}

function sortPokemon() {
    let option = document.getElementById("atrb").value;
    all_pokemon.sort((a, b) => {
        switch (option) {
            case "2": {
                return (parseInt(a.weight) - parseInt(b.weight)); // weight
            }
            case "3": {
                return (parseInt(a.base_experience) - parseInt(b.base_experience)); // base_exp
            } 
            default: {
                return (parseInt(a.order) - parseInt(b.order)); // order
            } 
        }
    });
    document.getElementById("card-container").innerHTML = "";
    all_pokemon.forEach(pokemon => {
        cardGenerator(pokemon);
    });
}

function searchPokemon() {
    let search = document.getElementsByTagName("input")[0].value;
    let search_cards = all_pokemon.filter(pokemon => pokemon.name.startsWith(search));
    document.getElementById("card-container").innerHTML = "";
    search_cards.forEach(pokemon => {
        cardGenerator(pokemon);
    });
}

async function fetchPokemon(pokemon_url) {
    let response = await fetch(pokemon_url);
    pokemon_data = await response.json();
    all_pokemon.push(pokemon_data);
    cardGenerator(pokemon_data);
    sortPokemon();
}

async function fetchData(base_url) {
    let response = await fetch(base_url);
    pokemons = await response.json();
    let results = pokemons.results;
    results.forEach(element => {
        fetchPokemon(element.url);
    });
}

function generateURL() {
    offset += 20;
    let new_url = "https://pokeapi.co/api/v2/pokemon?offset=" + offset + "&limit=20";
    fetchData(new_url);
}

fetchData(base_url);

document.getElementById("b2").addEventListener("click", generateURL);
let sel = document.getElementById("atrb");
sel.onchange = sortPokemon;

let search = document.getElementsByTagName("input")[0];
search.oninput = searchPokemon;