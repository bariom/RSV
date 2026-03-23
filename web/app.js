const places = [
  {
    title: "Battistero di San Giovanni",
    tag: "V secolo",
    text: "Luogo simbolo della fase paleocristiana di Riva San Vitale, sorto probabilmente su fondazioni romane."
  },
  {
    title: "Chiesa di San Vitale",
    tag: "Pieve storica",
    text: "Centro della storia religiosa locale, ricostruita nel Settecento su una tradizione molto piu antica."
  },
  {
    title: "Tempio di Santa Croce",
    tag: "1582-1599",
    text: "Grande architettura tardorinascimentale legata alla committenza di Giovan Andrea Della Croce."
  }
];

const timeline = [
  {
    date: "774",
    title: "Primo Sobenno",
    text: "Le fonti ricordano una delle piu antiche forme del nome del villaggio."
  },
  {
    date: "1115",
    title: "Ripa Sancti Vitalis",
    text: "Il centro compare tra i beni dell'abbazia di Sant'Abbondio di Como."
  },
  {
    date: "Circa 500",
    title: "Costruzione del Battistero",
    text: "Il Battistero di San Giovanni testimonia l'antichita del centro cristiano locale."
  },
  {
    date: "23 febbraio - 16 marzo 1798",
    title: "Repubblica di Riva San Vitale",
    text: "Breve esperienza politica nata nel clima rivoluzionario del Mendrisiotto."
  },
  {
    date: "1803",
    title: "Fondazione del Canton Ticino",
    text: "Riva San Vitale entra nel nuovo quadro cantonale."
  },
  {
    date: "2003 / 2010",
    title: "Monte San Giorgio e UNESCO",
    text: "Il riconoscimento internazionale valorizza il paesaggio fossilifero condiviso dal territorio."
  }
];

const people = [
  {
    title: "Beato Manfredo Settala",
    role: "Figura devozionale",
    text: "Secondo la tradizione visse da eremita sul Monte San Giorgio e la sua memoria resta viva a Riva San Vitale."
  },
  {
    title: "Giovan Andrea Della Croce",
    role: "Canonico e committente",
    text: "E ricordato come promotore del tempio di Santa Croce, uno dei monumenti piu forti del borgo."
  },
  {
    title: "Don Gottardo Zurini",
    role: "Arciprete",
    text: "La memoria civica locale lo collega alla fondazione del Canton Ticino come primo presidente del Gran Consiglio."
  }
];

const sources = [
  {
    title: "Dizionario storico della Svizzera",
    text: "Profilo storico sintetico su Riva San Vitale, pieve, economia, monumenti e toponomastica.",
    url: "https://hls-dhs-dss.ch/it/articles/002242/"
  },
  {
    title: "Comune di Riva San Vitale",
    text: "Schede su cenni storici, Battistero paleocristiano, chiesa di San Vitale e tempio di Santa Croce.",
    url: "https://www.rivasanvitale.ch/Cenni-storici-a4b3f900"
  },
  {
    title: "UNESCO World Heritage Centre",
    text: "Scheda del Monte San Giorgio, con iscrizione nel 2003 e ampliamento nel 2010.",
    url: "https://whc.unesco.org/en/list/1090"
  },
  {
    title: "Ticino Turismo",
    text: "Schede divulgative su Battistero, Santa Croce e Festa del Beato Manfredo Settala.",
    url: "https://www.ticino.ch/en/home.html"
  }
];

function renderCards(containerId, items, mapper) {
  const container = document.getElementById(containerId);
  container.innerHTML = items.map(mapper).join("");
}

renderCards("places-grid", places, (item) => `
  <article class="place-card">
    <span class="tag">${item.tag}</span>
    <h3>${item.title}</h3>
    <p>${item.text}</p>
  </article>
`);

renderCards("timeline-list", timeline, (item) => `
  <article class="timeline-item">
    <span class="timeline-date">${item.date}</span>
    <h3>${item.title}</h3>
    <p>${item.text}</p>
  </article>
`);

renderCards("people-grid", people, (item) => `
  <article class="person-card">
    <span class="tag">${item.role}</span>
    <h3>${item.title}</h3>
    <p>${item.text}</p>
  </article>
`);

renderCards("sources-list", sources, (item) => `
  <article class="source-card">
    <h3>${item.title}</h3>
    <p>${item.text}</p>
    <a href="${item.url}" target="_blank" rel="noreferrer">Apri la fonte</a>
  </article>
`);
