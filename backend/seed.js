const mongoose = require("mongoose");
const City = require("./models/city.model");

mongoose
  .connect(
    "mongodb+srv://seth:dymatrip123@cluster0.7jok5.mongodb.net/dymatrip?retryWrites=true&w=majority",
    {
      useNewUrlParser: true
    }
  )
  .then(() => {
    Promise.all([
      //----------------------- Los Angeles --------------------------------------------------------
   new City({
     name: "Los Angeles",
     image: "http://10.0.2.2/assets/images/los_angeles.jpg",
     activities: [
       {
         image: "http://10.0.2.2/assets/images/activities/universal_studios.jpg",
         name: "Les studios Universal",
         city: "Los Angeles",
         price: 35.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/venice_beach.jpg",
         name: "Venice beach",
         city: "Los Angeles",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities//hollywood_sign.jpg",
         name: "Hollywood sign",
         city: "Los Angeles",
         price: 15.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/santa_monica.jpg",
         name: "Santa Monica",
         city: "Los Angeles",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/hollywood_walk.jpg",
         name: "Hollywood walk",
         city: "Los Angeles",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/little_tokyo.jpg",
         name: "Little Tokyo",
         city: "Los Angeles",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/venice_canals.jpg",
         name: "Venice canals",
         city: "Los Angeles",
         price: 25.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/kelso_dunes.jpg",
         name: "Kelso Dunes",
         city: "Los Angeles",
         price: 0.0
       }
     ]
   }).save(),
   //----------------------- London -------------------------------------------------------------
   new City({
     name: "Londres",
     image: "http://10.0.2.2/assets/images/london.jpg",
     activities: [
       {
         image: "http://10.0.2.2/assets/images/activities/big_ben.jpg",
         name: "Big Ben",
         city: "London",
         price: 17.75
        },
        {
         image: "http://10.0.2.2/assets/images/activities/buckingham_palace.jpg",
         name: "Buckingham Palace",
         city: "London",
         price: 22.89
        },
       {
         image: "http://10.0.2.2/assets/images/activities/piccadilly_circus_and_trafalgar_square.jpg",
         name: "Piccadilly Circus & Trafalgar Square",
         city: "London",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/british_museum.jpg",
         name: "The British Museum",
         city: "London",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/madame_tussauds.jpg",
         name: "Madame Tussauds",
         city: "London",
         price: 42.59
       },
       {
         image: "http://10.0.2.2/assets/images/activities/kew_gardens.jpg",
         name: "Kew Gardens",
         city: "London",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/westminster_abbey.jpg",
         name: "Westminster Abbey",
         city: "London",
         price: 5.92
       },
       {
         image: "http://10.0.2.2/assets/images/activities/the_victoria_and_albert_museum.jpg",
         name: "The Victoria & Albert Museum",
         city: "London",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/st_paul_s_cathedral.jpg",
         name: "St Paul's Cathedral",
         city: "London",
         price: 23.66
       },
       {
         image: "http://10.0.2.2/assets/images/activities/hyde_park.jpg",
         name: "Hyde Park",
         city: "London",
         price: 0.0
       },
     ]
   }).save(),
   //----------------------- Stockholm ----------------------------------------------------------
   new City({
     name: "Stockholm",
     image: "http://10.0.2.2/assets/images/stockholm.jpg",
     activities: [
       {
         image: "http://10.0.2.2/assets/images/activities/gamla_stan.jpg",
         name: "Gamla Stan",
         city: "Stockholm",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/djugarden.jpg",
         name: "Djurgarden",
         city: "Stockholm",
         price: 0.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/skansen_open_air_museum.jpg",
         name: "Skansen Open-Air Museum",
         city: "Stockholm",
         price: 10.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/the_royal_palace.jpg",
         name: "The Royal Palace",
         city: "Stockholm",
         price: 2.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/vasa_museum.jpg",
         name: "Vasa Museum",
         city: "Stockholm",
         price: 13.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/the_city_hall.jpg",
         name: "The City Hall (Stadshuset)",
         city: "Stockholm",
         price: 7.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/abba_museum.jpg",
         name: "Abba Museum",
         city: "Stockholm",
         price: 25.0
       },
       {
         image: "http://10.0.2.2/assets/images/activities/royal_national_city_park.jpg",
         name: "Royal National City Park",
         city: "Stockholm",
         price: 0.0
       },
     ]
   }).save(),
   //----------------------- Moscow -------------------------------------------------------------
   new City({
       name: "Moscou",
       image: "http://10.0.2.2/assets/images/moscow.jpg",
       activities: [
         {
           image: "http://10.0.2.2/assets/images/activities/st_basil_cathedral.jpg",
           name: "Cathédrale St Basile",
           city: "Moscow",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/kremlin.jpg",
           name: "Le Kremlin",
           city: "Moscow",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/peter_the_great.jpg",
           name: "Peter Le Grand",
           city: "Moscow",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/gorky_park.jpg",
           name: "Gorky Park",
           city: "Moscow",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/bolshoi.jpg",
           name: "Théâtre du Bolshoi",
           city: "Moscow",
           price: 55.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/red_square.jpg",
           name: "La Place Rouge",
           city: "Moscow",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/tretyakov_gallery.jpg",
           name: "Galerie Tretyakov",
           city: "Moscow",
           price: 25.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/tverskaya_street.jpg",
           name: "Tverskaya Street",
           city: "Moscow",
           price: 0.0
         }
       ]
     }).save(),
     //----------------------- Milan ------------------------------------------------------------
     new City({
       name: "Milan",
       image: "http://10.0.2.2/assets/images/milan.jpg",
       activities: [
         {
           image: "http://10.0.2.2/assets/images/activities/duomo.jpg",
           name: "Cathédrale de Milan",
           city: "Milan",
           price: 12.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/santa_maria_delle_grazie.jpg",
           name: "Église Santa Maria delle Graziee",
           city: "Milan",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/gallery_milan.jpg",
           name: "Galerie Vittorio Emanuele II",
           city: "Milan",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/castello_sforzesco.jpg",
           name: "Castello Sforzesco",
           city: "Milan",
           price: 15.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/pinacotera.jpg",
           name: "Pinacoteca di Brera",
           city: "Milan",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/piazza_dei_mercanti.jpg",
           name: "Piazza dei Mercanti",
           city: "Milan",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/piazza_del_duomo.jpg",
           name: "Piazza del Duomo",
           city: "Milan",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/scala.jpg",
           name: "La Scala",
           city: "Milan",
           price: 100.0
         }
       ]
     }).save(),
     //----------------------- Helsinki ---------------------------------------------------------
     new City({
       name: "Helsinki",
       image: "http://10.0.2.2/assets/images/helsinki.jpg",
       activities: [
         {
           image: "http://10.0.2.2/assets/images/activities/helsinki_cathedral.jpg",
           name: "Cathédrale Luthérienne",
           city: "Helsinki",
           price: 17.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/design_district.jpg",
           name: "Magasins du  Design District",
           city: "Helsinki",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/market_square.jpg",
           name: "Market Square",
           city: "Helsinki",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/seurasaari.jpg",
           name: "Musée en plein air Seurasaari",
           city: "Helsinki",
           price: 10.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/uspenskia.jpg",
           name: "Cathédrale Uspenskia",
           city: "Helsinki",
           price: 9.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/kiasma.jpg",
           name: "Musée d'Art contemporain",
           city: "Helsinki",
           price: 7.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/ateneum.jpg",
           name: "Musée Ateneum",
           city: "Helsinki",
           price: 25.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/korkeasaari_zoo.jpg",
           name: "Zoo Korkeasaari",
           city: "Helsinki",
           price: 15.0
         }
       ]
     }).save(),
     //----------------------- Tokyo ------------------------------------------------------------
     new City({
       name: "Tokyo",
       image: "http://10.0.2.2/assets/images/tokyo.jpg",
       activities: [
         {
           image: "http://10.0.2.2/assets/images/activities/imperial_palace.jpg",
           name: "Le Palais Impérial",
           city: "Tokyo",
           price: 23.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/meji_shrine.jpg",
           name: "Meji Shrine",
           city: "Tokyo",
           price: 14.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/sensoji_temple.jpg",
           name: "Temple Sensoji",
           city: "Tokyo",
           price: 12.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/odaiba.jpg",
           name: "Odaiba",
           city: "Tokyo",
           price: 10.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/shinjuku_gyoen_national_garden.jpg",
           name: "Jardin National Shinjuku Gyoen",
           city: "Tokyo",
           price: 9.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/tokyo_metropolitan_building.jpg",
           name: "Tokyo Metropolitan Building",
           city: "Tokyo",
           price: 7.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/akihabara.jpg",
           name: "Akihabara",
           city: "Tokyo",
           price: 25.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/fuji.jpg",
           name: "Le Mont Fuji",
           city: "Tokyo",
           price: 15.0
         }
       ]
     }).save(),
     //----------------------- Rio de Janeiro ---------------------------------------------------
     new City({
       name: "Rio de Janeiro",
       image: "http://10.0.2.2/assets/images/rio.jpg",
       activities: [
         {
           image: "http://10.0.2.2/assets/images/activities/corcovado.jpg",
           name: "Le Corcovado",
           city: "Rio de Janeiro",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/sugar_mountain.jpg",
           name: "La Pain de Sucre",
           city: "Rio de Janeiro",
           price: 15.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/morro.jpg",
           name: "Morro Da Urca",
           city: "Rio de Janeiro",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/ipanema.jpg",
           name: "Ipanema Beach",
           city: "Rio de Janeiro",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/barra.jpg",
           name: "Barra da Tijuca",
           city: "Rio de Janeiro",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/pedra_bonita.jpg",
           name: "Pedra Bonita",
           city: "Rio de Janeiro",
           price: 0.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/maracana.jpg",
           name: "Le Maracanã",
           city: "Rio de Janeiro",
           price: 25.0
         },
         {
           image: "http://10.0.2.2/assets/images/activities/amanha.jpg",
           name: "Museu do Amanhã",
           city: "Rio de Janeiro",
           price: 15.0
         }
       ]
      }).save()
    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
