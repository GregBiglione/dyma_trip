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
         price: 35.0,
         address: "100 Universal City Plaza, Universal City, CA 91608",
         latitude: 34.138290,
         longitude: -118.359421
       },
       {
         image: "http://10.0.2.2/assets/images/activities/venice_beach.jpg",
         name: "Venice beach",
         city: "Los Angeles",
         price: 0.0,
         address: "Los Angeles",
         latitude: 33.985046,
         longitude: -118.469482
       },
       {
         image: "http://10.0.2.2/assets/images/activities//hollywood_sign.jpg",
         name: "Hollywood sign",
         city: "Los Angeles",
         price: 15.0,
         address: "Los Angeles, CA 90068",
         latitude: 34.134412073890374,
         longitude:  -118.32114011061758
       },
       {
         image: "http://10.0.2.2/assets/images/activities/santa_monica.jpg",
         name: "Santa Monica",
         city: "Los Angeles",
         price: 0.0,
         address: "Los Angeles",
         latitude: 34.01915222908988,
         longitude: -118.49174238793165
       },
       {
         image: "http://10.0.2.2/assets/images/activities/hollywood_walk.jpg",
         name: "Hollywood walk",
         city: "Los Angeles",
         price: 0.0,
         address: "Hollywood Boulevard, Vine St, Los Angeles, CA 90028",
         latitude: 34.101812159442176,
         longitude: -118.32664072939764
       },
       {
         image: "http://10.0.2.2/assets/images/activities/little_tokyo.jpg",
         name: "Little Tokyo",
         city: "Los Angeles",
         price: 0.0,
         address: "Los Angeles",
         latitude: 34.05263899683069,
         longitude: -118.2409308154593,
       },
       {
         image: "http://10.0.2.2/assets/images/activities/venice_canals.jpg",
         name: "Venice canals",
         city: "Los Angeles",
         price: 25.0,
         address: "Venice, CA 90292",
         latitude: 33.98371619239909,
         longitude: -118.46768050241619
       },
       {
         image: "http://10.0.2.2/assets/images/activities/kelso_dunes.jpg",
         name: "Kelso Dunes",
         city: "Los Angeles",
         price: 0.0,
         address: "Californie",
         latitude: 34.9119118451539,
         longitude:  -115.73106602247377
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
         price: 17.75,
         address: "London SW1A 0AA",
         latitude: 51.500862754448136,
         longitude: -0.124078231191973
        },
        {
         image: "http://10.0.2.2/assets/images/activities/buckingham_palace.jpg",
         name: "Buckingham Palace",
         city: "London",
         price: 22.89,
         address: "London SW1A 1AA",
         latitude: 51.50147083802834,
         longitude: -0.14123554283307677
        },
       {
         image: "http://10.0.2.2/assets/images/activities/piccadilly_circus_and_trafalgar_square.jpg",
         name: "Piccadilly Circus & Trafalgar Square",
         city: "London",
         price: 0.0,
         address: "Building 225, Criterion, 229 Piccadilly, London W1J 9HR",
         latitude: 51.51009417259788,
         longitude: -0.13372777483718215
       },
       {
         image: "http://10.0.2.2/assets/images/activities/british_museum.jpg",
         name: "The British Museum",
         city: "London",
         price: 0.0,
         address: "Great Russell St, London WC1B 3DG",
         latitude: 51.519586855619075,
         longitude: -0.12652744838599422
       },
       {
         image: "http://10.0.2.2/assets/images/activities/madame_tussauds.jpg",
         name: "Madame Tussauds",
         city: "London",
         price: 42.59,
         address: "Marylebone Rd, London NW1 5LR",
         latitude: 51.5230908098992,
         longitude: -0.1542540134624757
       },
       {
         image: "http://10.0.2.2/assets/images/activities/kew_gardens.jpg",
         name: "Kew Gardens",
         city: "London",
         price: 0.0,
         address: "Richmond",
         latitude: 51.478890782775515,
         longitude: -0.29577684970492624
       },
       {
         image: "http://10.0.2.2/assets/images/activities/westminster_abbey.jpg",
         name: "Westminster Abbey",
         city: "London",
         price: 5.92,
         address: "20 Deans Yd, London SW1P 3PA",
         latitude: 51.49943163699077,
         longitude: -0.127043823087993
       },
       {
         image: "http://10.0.2.2/assets/images/activities/the_victoria_and_albert_museum.jpg",
         name: "The Victoria & Albert Museum",
         city: "London",
         price: 0.0,
         address: "Cromwell Rd, London SW7 2RL",
         latitude: 51.49677276643467,
         longitude: -0.17212635764293174
       },
       {
         image: "http://10.0.2.2/assets/images/activities/st_paul_s_cathedral.jpg",
         name: "St Paul's Cathedral",
         city: "London",
         price: 23.66,
         address: "St. Paul's Churchyard, London EC4M 8AD",
         latitude: 51.51395210876195,
         longitude: -0.09816821161161417
       },
       {
         image: "http://10.0.2.2/assets/images/activities/hyde_park.jpg",
         name: "Hyde Park",
         city: "London",
         price: 0.0,
         address: "London",
         latitude: 51.50733495750792,
         longitude: -0.1659663362114748
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
         price: 0.0,
         address: "Gamla Stan, Stockholm",
         latitude: 59.3254832820551,
         longitude: 18.067059543406966
       },
       {
         image: "http://10.0.2.2/assets/images/activities/djugarden.jpg",
         name: "Djurgarden",
         city: "Stockholm",
         price: 0.0,
         address: "Östermalm, Stockholm",
         latitude: 59.32654261176836,
         longitude: 18.11323886053131
       },
       {
         image: "http://10.0.2.2/assets/images/activities/skansen_open_air_museum.jpg",
         name: "Skansen Open-Air Museum",
         city: "Stockholm",
         price: 10.0,
         address: "Djurgårdsslätten 49-51, 115 21 Stockholm",
         latitude: 59.32715751816842,
         longitude: 18.103756327336537
       },
       {
         image: "http://10.0.2.2/assets/images/activities/the_royal_palace.jpg",
         name: "The Royal Palace",
         city: "Stockholm",
         price: 2.0,
         address: "Kungliga slottet, 107 70 Stockholm",
         latitude: 59.32697473124905,
         longitude: 18.071858873367166
       },
       {
         image: "http://10.0.2.2/assets/images/activities/vasa_museum.jpg",
         name: "Vasa Museum",
         city: "Stockholm",
         price: 13.0,
         address: "Galärvarvsvägen 14, 115 21 Stockholm",
         latitude: 59.328138214851826,
         longitude: 18.091782636592658
       },
       {
         image: "http://10.0.2.2/assets/images/activities/the_city_hall.jpg",
         name: "The City Hall (Stadshuset)",
         city: "Stockholm",
         price: 7.0,
         address: "Hantverkargatan 1, 111 52 Stockholm",
         latitude: 59.32890513786966,
         longitude: 18.045609456219697
       },
       {
         image: "http://10.0.2.2/assets/images/activities/abba_museum.jpg",
         name: "Abba Museum",
         city: "Stockholm",
         price: 25.0,
         address: "Djurgårdsvägen 68, 115 21 Stockholm",
         latitude: 59.32501150486366,
         longitude: 18.097255477069535
       },
       {
         image: "http://10.0.2.2/assets/images/activities/royal_national_city_park.jpg",
         name: "Royal National City Park",
         city: "Stockholm",
         price: 0.0,
         address: "115 21 Stockholm",
         latitude: 59.32702997395135,
         longitude: 18.125158415445743
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
           price: 0.0,
           address: "Red Square, Moscow, Russie, 109012",
           latitude: 55.75261948605264,
           longitude: 37.62319408670836
         },
         {
           image: "http://10.0.2.2/assets/images/activities/kremlin.jpg",
           name: "Le Kremlin",
           city: "Moscow",
           price: 0.0,
           address: "Moscow, Russie, 103132",
           latitude: 55.7521748971952,
           longitude: 37.617515184839725
         },
         {
           image: "http://10.0.2.2/assets/images/activities/peter_the_great.jpg",
           name: "Peter Le Grand",
           city: "Moscow",
           price: 0.0,
           address: "Krymskaya Naberezhnaya, 10, Moscow, Russie, 119072",
           latitude: 55.73869556051236,
           longitude: 37.60835889834883
         },
         {
           image: "http://10.0.2.2/assets/images/activities/gorky_park.jpg",
           name: "Gorky Park",
           city: "Moscow",
           price: 0.0,
           address: "улица Крымский Вал, 9.11, Moscow, Russie, 101000",
           latitude: 55.73153990830619,
           longitude: 37.60382567506634
         },
         {
           image: "http://10.0.2.2/assets/images/activities/bolshoi.jpg",
           name: "Théâtre du Bolshoi",
           city: "Moscow",
           price: 55.0,
           address: "Theatre Square, 1, Moscow, Russie, 125009",
           latitude: 55.760085187140525,
           longitude: 37.619034836441706
         },
         {
           image: "http://10.0.2.2/assets/images/activities/red_square.jpg",
           name: "La Place Rouge",
           city: "Moscow",
           price: 0.0,
           address: "Red Square, Moscow, Russie, 109012",
           latitude: 55.75409933392073,
           longitude: 37.62079499834946
         },
         {
           image: "http://10.0.2.2/assets/images/activities/tretyakov_gallery.jpg",
           name: "Galerie Tretyakov",
           city: "Moscow",
           price: 25.0,
           address: "Lavrushinsky Ln, 10, Moscow, Russie, 119017",
           latitude: 55.741515811407595,
           longitude: 37.6213252382921
         },
         {
           image: "http://10.0.2.2/assets/images/activities/tverskaya_street.jpg",
           name: "Tverskaya Street",
           city: "Moscow",
           price: 0.0,
           address: "Moscou",
           latitude: 55.7650302943724,
           longitude: 37.60535136951405
         }
       ]
     }).save(),
     //----------------------- Milan ------------------------------------------------------------
     new City({
       name: "Milan",
       image: "http://10.0.2.2/assets/images/milan.jpg",
       activities: [
         {
           image: "http://10.0.2.2/assets/images/activities/cathedral.jpg",
           name: "Cathédrale de Milan",
           city: "Milan",
           price: 12.0,
           address: "P.za del Duomo, 20122 Milano MI",
           latitude: 45.4642589836982,
           longitude: 9.19188603153988
         },
         {
           image: "http://10.0.2.2/assets/images/activities/santa_maria_delle_grazie.jpg",
           name: "Église Santa Maria delle Grazie",
           city: "Milan",
           price: 0.0,
           address: "Piazza di Santa Maria delle Grazie, 20123 Milano MI",
           latitude: 45.46612099306565,
           longitude: 9.170876267264141
         },
         {
           image: "http://10.0.2.2/assets/images/activities/gallery_milan.jpg",
           name: "Galerie Vittorio Emanuele II",
           city: "Milan",
           price: 0.0,
           address: "P.za del Duomo, 20123 Milano MI",
           latitude: 45.466040808891144,
           longitude: 9.189919888161372
         },
         {
           image: "http://10.0.2.2/assets/images/activities/castello_sforzesco.jpg",
           name: "Castello Sforzesco",
           city: "Milan",
           price: 15.0,
           address: "Piazza Castello, 20121 Milano MI",
           latitude: 45.470656751994255,
           longitude: 9.179278853772013,
         },
         {
           image: "http://10.0.2.2/assets/images/activities/pinacotera.jpg",
           name: "Pinacoteca di Brera",
           city: "Milan",
           price: 0.0,
           address: "Via Brera, 28, 20121 Milano MI, Italie",
           latitude: 45.47208990527302,
           longitude: 9.18784668445911
         },
         {
           image: "http://10.0.2.2/assets/images/activities/piazza_dei_mercanti.jpg",
           name: "Piazza dei Mercanti",
           city: "Milan",
           price: 0.0,
           address: "20123 Milan, Italie",
           latitude: 45.46474782625594,
           longitude: 9.187649835028882
         },
         {
           image: "http://10.0.2.2/assets/images/activities/piazza_del_duomo.jpg",
           name: "Piazza del Duomo",
           city: "Milan",
           price: 0.0,
           address: "P.za del Duomo, 20121 Milano MI",
           latitude: 45.46423075489982,
           longitude: 9.1896837061929
         },
         {
           image: "http://10.0.2.2/assets/images/activities/scala.jpg",
           name: "La Scala",
           city: "Milan",
           price: 100.0,
           address: "Via Filodrammatici, 2, 20121 Milano MI",
           latitude: 45.46749237054424,
           longitude: 9.189926707207377
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
           price: 17.0,
           address: "Unioninkatu 29, 00170 Helsinki",
           latitude: 60.17053649042731,
           longitude: 24.952197285044814
         },
         {
           image: "http://10.0.2.2/assets/images/activities/design_district.jpg",
           name: "Design District",
           city: "Helsinki",
           price: 0.0,
           address: "Design District, Helsinki",
           latitude: 60.16492712967627,
           longitude: 24.946396355560143
         },
         {
           image: "http://10.0.2.2/assets/images/activities/market_square.jpg",
           name: "Market Square",
           city: "Helsinki",
           price: 0.0,
           address: "Eteläranta, 00170 Helsinki",
           latitude: 60.16776668870494,
           longitude: 24.953688527372922
         },
         {
           image: "http://10.0.2.2/assets/images/activities/seurasaari.jpg",
           name: "Musée en plein air Seurasaari",
           city: "Helsinki",
           price: 10.0,
           address: "Seurasaari, 00250 Helsinki",
           latitude: 60.181604115916436,
           longitude: 24.884183029224708
         },
         {
           image: "http://10.0.2.2/assets/images/activities/uspenskia.jpg",
           name: "Cathédrale Uspenskia",
           city: "Helsinki",
           price: 9.0,
           address: "Kanavakatu 1, 00160 Helsinki",
           latitude: 60.16861296370174,
           longitude: 24.96033623662904
         },
         {
           image: "http://10.0.2.2/assets/images/activities/kiasma.jpg",
           name: "Musée d'Art contemporain",
           city: "Helsinki",
           price: 7.0,
           address: "Mannerheiminaukio 2, 00100 Helsinki",
           latitude: 60.172131757726184,
           longitude: 24.936593867850178
         },
         {
           image: "http://10.0.2.2/assets/images/activities/ateneum.jpg",
           name: "Musée Ateneum",
           city: "Helsinki",
           price: 25.0,
           address: "Kaivokatu 2, 00100 Helsinki",
           latitude: 60.17031080162174,
           longitude: 24.944070940865398,
         },
         {
           image: "http://10.0.2.2/assets/images/activities/korkeasaari_zoo.jpg",
           name: "Zoo Korkeasaari",
           city: "Helsinki",
           price: 15.0,
           address: "Mustikkamaanpolku 12, 00270 Helsinki",
           latitude: 60.17550705412044,
           longitude:  24.98485178711029
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
           price: 23.0,
           address: "1-1 Chiyoda, Chiyoda City, Tokyo 100-8111, Japon",
           latitude: 35.68523796673725,
           longitude: 139.75296774637292
         },
         {
           image: "http://10.0.2.2/assets/images/activities/meji_shrine.jpg",
           name: "Meji Shrine",
           city: "Tokyo",
           price: 14.0,
           address: "1-1 Yoyogikamizonocho, Shibuya City, Tokyo 151-8557",
           latitude: 35.676571885788164,
           longitude: 139.69932589763218,
         },
         {
           image: "http://10.0.2.2/assets/images/activities/sensoji_temple.jpg",
           name: "Temple Sensoji",
           city: "Tokyo",
           price: 12.0,
           address: "2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032",
           latitude: 35.71492150698475,
           longitude: 139.79670057858735
         },
         {
           image: "http://10.0.2.2/assets/images/activities/odaiba.jpg",
           name: "Odaiba",
           city: "Tokyo",
           price: 10.0,
           address: "1-chōme-4 Daiba, Minato City, Tokyo 135-0091",
           latitude: 35.62917023490704,
           longitude: 139.7737690283223
         },
         {
           image: "http://10.0.2.2/assets/images/activities/shinjuku_gyoen_national_garden.jpg",
           name: "Jardin National Shinjuku Gyoen",
           city: "Tokyo",
           price: 9.0,
           address: "11 Naitomachi, Shinjuku City, Tokyo 160-0014",
           latitude: 35.68535056660999,
           longitude: 139.70992295160192,
         },
         {
           image: "http://10.0.2.2/assets/images/activities/tokyo_metropolitan_building.jpg",
           name: "Tokyo Metropolitan Building",
           city: "Tokyo",
           price: 7.0,
           address: "2 Chome-8-1 Nishishinjuku, Shinjuku City, Tokyo 163-8001",
           latitude: 35.690331897371934,
           longitude: 139.6921511243505
         },
         {
           image: "http://10.0.2.2/assets/images/activities/akihabara.jpg",
           name: "Akihabara",
           city: "Tokyo",
           price: 25.0,
           address: "Taitō, Tokyo 110-0006",
           latitude: 35.70239024172867,
           longitude: 139.7743910650947
         },
         {
           image: "http://10.0.2.2/assets/images/activities/fuji.jpg",
           name: "Le Mont Fuji",
           city: "Tokyo",
           price: 15.0,
           address: "Kitayama, Fujinomiya, Préfecture de Shizuoka 418-0112",
           latitude: 35.36132465259958,
           longitude: 138.72749210842164
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
           price: 0.0,
           address: "Alto da Boa Vista, Rio de Janeiro - État de Rio de Janeiro",
           latitude: -22.951837628569557,
           longitude: -43.211446742465775
         },
         {
           image: "http://10.0.2.2/assets/images/activities/sugar_mountain.jpg",
           name: "Le Pain de Sucre",
           city: "Rio de Janeiro",
           price: 15.0,
           address: "Urca, Rio de Janeiro - État de Rio de Janeiro",
           latitude: -22.948586191690268,
           longitude: -43.15448991177963
         },
         {
           image: "http://10.0.2.2/assets/images/activities/morro.jpg",
           name: "Morro Da Urca",
           city: "Rio de Janeiro",
           price: 0.0,
           address: "Urca, Rio de Janeiro - État de Rio de Janeiro",
           latitude: -22.950096190199456,
           longitude: -43.164268342466364
         },
         {
           image: "http://10.0.2.2/assets/images/activities/ipanema.jpg",
           name: "Ipanema Beach",
           city: "Rio de Janeiro",
           price: 0.0,
           address: "Ipanema, État de Rio de Janeiro, Brésil",
           latitude: -22.986778490401434,
           longitude: -43.20466528896597
         },
         {
           image: "http://10.0.2.2/assets/images/activities/barra.jpg",
           name: "Barra da Tijuca",
           city: "Rio de Janeiro",
           price: 0.0,
           address: "Barra da Tijuca, Rio de Janeiro",
           latitude: -23.000192990617027,
           longitude:  -43.36909739220616
         },
         {
           image: "http://10.0.2.2/assets/images/activities/pedra_bonita.jpg",
           name: "Pedra Bonita",
           city: "Rio de Janeiro",
           price: 0.0,
           address: "São Conrado, Rio de Janeiro - État de Rio de Janeiro",
           latitude: -22.98619441009032,
           longitude: -43.27869697314189,
         },
         {
           image: "http://10.0.2.2/assets/images/activities/maracana.jpg",
           name: "Le Maracanã",
           city: "Rio de Janeiro",
           price: 25.0,
           address: "Av. Pres. Castelo Branco, Portão 3 - Maracanã, Rio de Janeiro - RJ, 20271-130",
           latitude: -22.91202460687716,
           longitude: -43.23029996563881
         },
         {
           image: "http://10.0.2.2/assets/images/activities/amanha.jpg",
           name: "Museu do Amanhã",
           city: "Rio de Janeiro",
           price: 15.0,
           address: "Praça Mauá, 1 - Centro, Rio de Janeiro - RJ, 20081-240",
           latitude: -22.90278,
           longitude: -43.2075
         }
       ]
      }).save()
    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
