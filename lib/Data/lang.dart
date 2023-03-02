String currency = "DA";

List<String> langs = ["EN", "FR"];

int selectedLang = 0; //0: English, 1: Français

Map<String, Map<int, String>> weekdayLang = {
  "EN": {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday",
  },
  "FR": {
    1: "Lundi",
    2: "Mardi",
    3: "Mercredi",
    4: "Jeudi",
    5: "Vendredi",
    6: "Samedi",
    7: "Dimanche",
  },
};

Map<String, Map<int, String>> monthLang = {
  "EN": {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December",
  },
  "FR": {
    1: "Janvier",
    2: "Février",
    3: "Mars",
    4: "Avril",
    5: "Mai",
    6: "Juin",
    7: "Juillet",
    8: "Août",
    9: "Septembre",
    10: "Octobre",
    11: "Novembre",
    12: "Décembre",
  },
};

Map<String, List<String>> homeContentLang = {
  "EN": [
    "Welcome to HikeMe",
    "Search",
    "Favorite Groups",
    "Recommended",
    "Details",
    "Hike",
    "Camping"
  ],
  "FR": [
    "Bienvenu sur HikeMe",
    "Recherche",
    "Groupes Favoris",
    "Recommandés",
    "Détails",
    "Randonnée",
    "Bivouac"
  ],
};

Map<String, List<String>> eventContentLang = {
  "EN": [
    "Your location",
    "Price",
    "The difficulty of the hike.",
    "The hiking distance.",
    "The weather will be",
    "These seats are \nalready reserved.",
    "Details"
  ],
  "FR": [
    "Votre emplacement",
    "Prix",
    "La difficulté de\nla randonnée.",
    "La distance de\nla randonnée.",
    "Le temps sera",
    "Les places dèja \nréservées.",
    "Détails"
  ],
};
