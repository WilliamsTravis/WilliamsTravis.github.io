
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Travis M. Williams"
#let locale-catalog-page-numbering-style = context { "Travis M. Williams - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Oct 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-partial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-small-caps-for-name = false
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = left
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-nested-bullet = "-"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-nested-bullet,
  spacing: design-highlights-vertical-space-between-highlights,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let bullet-entry(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: 0pt,
    indent: 0pt,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #if design-header-small-caps-for-name [
    #smallcaps(it.body)
  ] else [
    #it.body
  ]
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-partial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Travis M. Williams

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Longmont, Colorado],
  [#box(original-link("mailto:twillico@proton.me")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)twillico\@proton.me])],
  [#box(original-link("tel:+1-850-510-3048")[#fa-icon("phone", size: 0.9em) #h(0.05cm)\(850\) 510-3048])],
  [#box(original-link("https://linkedin.com/in/TravisMWilliams")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)TravisMWilliams])],
  [#box(original-link("https://github.com/WilliamsTravis")[#fa-icon("github", size: 0.9em) #h(0.05cm)WilliamsTravis])],
  [#box(original-link("https://gitlab.com/twillico")[#fa-icon("gitlab", size: 0.9em) #h(0.05cm)twillico])],
)
#connections(connections-list)



== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[M.A.]],
  middle-content: [
    #strong[University of Colorado], Geography
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Focus: Climate Risk Management, Drought, Research, Geospatial Modeling.],[Advisors: William R. Travis, Stefan Leyk, Barabara P. Buttenfield],[Thesis: #emph[Drought Index-Based Insurance for the US Cattle Ranching Industry]],[Cumulative GPA: 3.90],)
  ],
  right-content: [
    Boulder, CO

Aug 2018
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[B.S.]],
  middle-content: [
    #strong[Florida State University], Geography
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Focus: GIS, Ecology, French],[Minors: Biology, French],[Cumulative GPA: 3.39],)
  ],
  right-content: [
    Tallahassee, FL

Aug 2009
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[National Renenwable Energy Laboratory], Researcher III - Geospatial Data Science
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [My primary role at NREL is centered on the Renewable Energy Potential Model \(reV\). I have been the technical lead on this model since 2020 \(shortly after it was open-sourced\). Secondary roles at NREL include the development of other research models, data management, analysis, research, writing, and visualization for energy systems research projects.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designing analysis projects, collecting or building input data, and running models on NREL HPC systems],[Manage the reV model's maintenance budget],[Manage the reV models input data collection, filesystem, and compute environment on the HPC],[Train employees on reV and HPC],[Support and help existing users],[Interface with clients who want to use it with their own infrastructure],[Interface with the software developers \(and periodically contribute to the software\)],)
  ],
  right-content: [
    Golden, CO

Nov 2019 – Present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[University of Colorado - Geography Dept.], Research Assistant\/Visiting Researcher
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Worked with a group called Earth Lab studying drought, fire, and agriculture.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Co-authored literature review publication on adaptive ranching practices and drought information.],[Applied econometric methods to discover climate signals in a large market data set.],[Redesigned an existing rainfall insurance system to better manage drought-related agricultural risks.],[Developed and deployed interactive online risk management and decision-making tools.],[Generated descriptive charts, maps, and other graphical products.],[Built the Python package implementing the FIRED event delineation algorithm \(firedpy\)],)
  ],
  right-content: [
    Boulder, CO

Jan 2017 – Nov 2019
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[University of Colorado - Geography Dept.], Teaching Assistant
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Taught recitations for groups of 25-30 students.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Geography of the Environment and Society & World Geography],[Topics included Human-Earth system interactions, theories of resource management, and natural hazard mitigation.],[Combination of content review, group activity, and grading.],[Focused on connecting course content with current events and engaging students in discussion.],[Features of 5 major world regions with a particular focus on culture and social injustice.],)
  ],
  right-content: [
    Boulder, CO

Aug 2016 – Dec 2017
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Southern Illinois University - Plant, Soil, & Ag. Systems Dept.], Research Assistant
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Soil sampling, laboratory tests, GIS analysis, research, & writing.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Collected plant tissue and soil samples with Truck Mounted Soil Probe, SPAD and other devices.],[Performed KCL extractions and other laboratory tests for agricultural chemicals content.],[Collected and interpreted climate data and site information for a large meta-analysis of high-yield fertilizer studies across the Midwest using various GIS programs.],[Used ArcGIS and SAS to perform spatial analysis into the performance of a no-till and cover crop study concurrent with extensive research into the practices],)
  ],
  right-content: [
    Carbondale, IL

Apr 2014 – May 2016
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Various], Various
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Various jobs in retail, environmental protection, landscaping, a rock masonry company, a boarding school, etc.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Lived and worked for a year off-grid in near Blackforest, NC],[Lived and worked for a few years on a family ranch near Vienna, IL],[etc],)
  ],
  right-content: [
    FL, NC, & IL

Aug 2003 – Apr 2014
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[Drought Index Portal \(DrIP\)]
  ],
  right-content: [
    Jan 2017 – Nov 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [An interactive data portal for comparing drought indices and exploring historical drought in the United States.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([#link("https://droughtindexportal.colorado.edu/")[https:\/\/droughtindexportal.colorado.edu]],[Interactive map and timeseries compares 42 different indicators of drought.],[Flexible enough to compare any two drought indices at any point, across any time period since 1900 or one index at mutliple points and time periods.],[Allows allows user to easily identify the severity and geographic extent worse historical droughts in the US to compare with current conditions.],[Was built with less than two years of experience in programming.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[reView]
  ],
  right-content: [
    Jan 2021 – Present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Another interactive data portal, this time to review outputs from the Renewable Energy Potential Model \(reV\).])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Renders spatial, statistical, and temporal outputs from reV model runs.],[Links location and graph visualization],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[GIS Interfaces:] QGIS, ArcMap, GRASS, & DIVA GIS]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Programming Languages:] Python, R, SQL, Bash, C, C++, HTML]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Geospatial Data Tools:] Geospatial Abstraction Library \(GDAL\), Rasdaman, PostGIS]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Research & Data Analysis:] Geospatial Analysis, Renewable Energy Technical Potential Modeling, Natural Hazards and Insurance \(particularly drought\), Soil Science, Econometrics]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Etc.:] Blender, OBS-Studio, Linux, SLURM, General Cartography]
)


== Publications


#two-col-entry(
  left-content: [
    #strong[Managing climate risks on the ranch with limited drought information]

  ],
  right-content: [
    02\/22\/2018
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Trisha Shrum, William Travis, Travis Williams, and Evan Lih

#v(design-highlights-top-margin - design-text-leading)Climate Risk Management 20, 11-26

#v(design-highlights-top-margin - design-text-leading)#link("https://www.sciencedirect.com/science/article/pii/S2212096317301407?via%3Dihub")[www.sciencedirect.com/science/article/pii/S2212096317301407?via%3Dihub]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Drought Index-based Insurance for the US Cattle Ranching Industry]

  ],
  right-content: [
    08\/15\/2018
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Travis Williams

#v(design-highlights-top-margin - design-text-leading)University of Colorado - Dissertations and Theses: 10843790

#v(design-highlights-top-margin - design-text-leading)#link("https://www.proquest.com/openview/85fc8e0e239dd79f9bcf646536cb338d/1?pq-origsite=gscholar&cbl=18750")[www.proquest.com/openview/85fc8e0e239dd79f9bcf646536cb338d/1?pq-origsite=gscholar&cbl=18750]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Evaluating Alternative Drought Indicators in a Weather Index Insurance Instrument]

  ],
  right-content: [
    06\/01\/2019
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Travis Williams and William Travis

#v(design-highlights-top-margin - design-text-leading)American Meteorological Society: Weather, Climate, and Society 11\(3\), 629-649

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1175/WCAS-D-18-0107.1")[doi.org/10.1175/WCAS-D-18-0107.1]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[FIRED \(Fire Events Delineation\): An Open, Flexible Algorithm and Database of US Fire Events Derived from the MODIS Burned Area Product \(2001–2019\)]

  ],
  right-content: [
    10\/24\/2020
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Jennifer Balch, Lise St. Denis, Adam Mahood, Nathan Mietkiewicz, Travis Williams, Joe McGlinchy, and Maxwell Cook

#v(design-highlights-top-margin - design-text-leading)Remote Sensing 12\(21\),3498

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.3390/rs12213498")[doi.org/10.3390/rs12213498]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[The Renewable Energy Potential \(reV\) Model: A Geospatial Platform for Technical Potential and Supply Curve Modeling]

  ],
  right-content: [
    06\/01\/2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Galen Maclaurin, Nick Grue, Anthony Lopez,Donna Heimiller, Michael Rossol, Grant Buster, and Travis Williams

#v(design-highlights-top-margin - design-text-leading)National Renewable Energy Laboratory, NREL\/TP-6A20-73067

#v(design-highlights-top-margin - design-text-leading)#link("https://docs.nrel.gov/docs/fy19osti/73067.pdf")[docs.nrel.gov/docs/fy19osti/73067.pdf]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Land Use and Turbine Technology Influences on Wind Potential in the United States]

  ],
  right-content: [
    05\/15\/2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Anthony Lopez, Trieu Mai, Eric Lantz, Dylan Harrison-Atlas, Travis Williams, and Galen Maclaurin

#v(design-highlights-top-margin - design-text-leading)Energy 223, 210044

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.energy.2021.120044")[doi.org/10.1016/j.energy.2021.120044]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[2021 Standard Scenarios Report: A U.S. Electricity Sector Outlook]

  ],
  right-content: [
    11\/01\/2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Wesley Cole, J. Carag, Maxwell Brown, Patrick Brown, Stuart Cohen, Kelly Eurek, Will Frazier, Pieter Gagnon, Nick Grue, Jonathan Ho, Anthony Lopez, Trieu Mai, Matthew Mowers, Caitlin Murphy, Brian Sergi, Dan Steinberg, and Travis Williams

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A40-80641

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/1834042")[doi.org/10.2172/1834042]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Wind Energy Costs in Puerto Rico Through 2035]

  ],
  right-content: [
    09\/01\/2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Patrick Duffy, Gabriel Zuckerman, Travis Williams, Alicia Key, Luis Martinez-Tossas, Owen Roberts, Nina Choquette, Jaemo Yang, Haiku Sky, and Nate Blair

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A40-83434

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/1891213")[doi.org/10.2172/1891213]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Turbine Scale and Siting Considerations in Wind Plant Layout Optimization and Implications for Capacity Density]

  ],
  right-content: [
    03\/07\/2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Andrew Stanley, Owen Roberts, Anthony Lopez, Travis Williams, and Aaron Barker

#v(design-highlights-top-margin - design-text-leading)Energy Reports 8, 3507-3525

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.egyr.2022.02.226")[doi.org/10.1016/j.egyr.2022.02.226]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[National-Scale Impacts on Wind Energy Production under Curtailment Scenarios to Reduce Bat Fatalities]

  ],
  right-content: [
    05\/24\/2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Galen Maclaurin, Cris Hein, Travis Williams, Owen Roberts, Eric Lantz, Grant Buster, and Anthony Lopez

#v(design-highlights-top-margin - design-text-leading)Wind Energy 25\(9\)

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1002/we.2741")[doi.org/10.1002/we.2741]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Exploring the Impact of Near-Term Innovations on the Technical Potential of Land-Based Wind Energy]

  ],
  right-content: [
    03\/01\/2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Owen Roberts, Travis Williams, Anthony Lopez, Galen Maclaurin, and Annika Eberle

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-500-81664

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/1963405")[doi.org/10.2172/1963405]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Impacts of Siting Considerations on Offshore Wind Technical Potential in the United States]

  ],
  right-content: [
    07\/01\/2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Gabriel Zuckerman, Anthony Lopez, Travis Williams, Rebecca Green, and Grant Buster

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A40-85088

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/1989233")[doi.org/10.2172/1989233]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Impact of Siting Ordinances on Land Availability for Wind and Solar Development]

  ],
  right-content: [
    08\/03\/2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Anthony Lopez, Wesley Cole, Brian Sergi, Aaron Levine, Jesse Carey, Cailee Mangan, Trieu Mai, Travis Williams, Pavlo Pinchuk, and Jianyu Gu

#v(design-highlights-top-margin - design-text-leading)Nature Energy 8, 1024-1043

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1038/s41560-023-01319-3")[doi.org/10.1038/s41560-023-01319-3]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Estimating National-Scale Wind Potential Using Spatially Explicit Turbine Layout Optimization]

  ],
  right-content: [
    10\/01\/2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Anthony Lopez, P. J. Stanley, Owen Roberts, Trieu Mai, Travis Williams, Pavlo Pinchuk, Grant Buster, and Eric Lantz

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A20-85075

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/2203429")[doi.org/10.2172/2203429]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Incorporating Wind Turbine Choice in High-Resolution Geospatial Supply Curve and Capacity Expansion Models]

  ],
  right-content: [
    01\/15\/2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Annika Eberle, Trieu Mai, Owen Roberts, Travis Williams, Pavlo Pinchuk, Anthony Lopez, Matthew Mowers, Joseph Mowers, Tyler Stehly, and Eric Lantz

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A20-87161

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/2283923")[doi.org/10.2172/2283923]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Solar Photovoltaics and Land-Based Wind Technical Potential and Supply Curves for the Contiguous United States: 2023 Edition]

  ],
  right-content: [
    01\/07\/2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Anthony Lopez, Pavlo Pinchuk, Michael Gleason, Wesley Cole, Trieu Mai, Travis Williams, Owen Roberts, Marie Rivers, Mike Bannister, Sophie-Min Thomson, Gabe Zuckerman, Brian Sergi

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A20-87843

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/2283517")[doi.org/10.2172/2283517]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[2023 Standard Scenarios Report: A U.S. Electricity Sector Outlook]

  ],
  right-content: [
    01\/15\/2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Pieter Gagnon, An Pham, Wesley Cole, Sarah Awara, Anne Barlas, Maxwell Brown, Patrick Brown, Vincent Carag, Stuart Cohen, Anne Hamilton, Jonathan Ho, Sarah Inskeep, Akash Karmakar, Luke Lavin, Anthony Lopez, Trieu Mai, Joseph Mowers, Matthew Mowers, Caitlin Murphy, Paul PinchukAnna Schleifer, Brian Sergi, Daniel Steinberg, and Travis Williams

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A20-87724

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/2274777")[doi.org/10.2172/2274777]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Puerto Rico Grid Resilience and Transitions to 100\% Renewable Energy Study \(PR100\): Final Report]

  ],
  right-content: [
    03\/01\/2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Murali Baggu, Robin Burton, Nate Blair, Manajit Sengupta, Tom Harris, Clayton Barrows, Haiku Sky, Vahan Gevorgian, Jeremy Keen, Elena Smith, Mike Campton, Sushmita Jena, Jaemo Yang, Travis Williams, Paritosh Das, James Elsworth, Prateek Joshi, Cameron Weiner, James Morris, Joseph McKinseySurya Chandan Dhulipala, Sam Molnar, Weihang Yan, Pranav Sharma, Wenbo Wang, Aadil Latif, Daniel Thom, Sourabh Dalvi, Ian Baring-Gould, Matthew Lave, Amanda Wachtel, C. Birk Jones, Emily Moog, Andrea Mammoli, Richard Garrett, Thad Haines, Will Vining, Cody Newlun, Olga Hart, Marcelo Elizondo, Xiaoyuan Fan, Patrick Maloney, Alok Bharati, Bharat Vyakaranam, Vishvas Chalishazar, Patrick Royer, Fernando Bereta dos Reis, Xue \(Michelle\) Li, Kaveri Mahapatra, Jeff Dagle, Xinda Ke, Meng Zhao, Orestis Vasios, Tycko Franklin, Michael Abdelmalak, Kishan Guddanti, Samrat Acharya, Marcos Cruz, Pavel Etingov, Chuan Qin, Juan Carlos Bedoya, Tony Nguyen, Sraddhanjoli Bhadra, Ahmad Tbaileh, Laura Ward, Victoria Sinnott, Pablo Mendez-Curbelo, Peter Cappers, Jeff Deason, Margaret Pigman, Lawrence Paul Lewis, John T. Murphy, Tomaz Kobayashi-Carvalhaes, Melanie Bennett, Yilu Liu, Harvey Cutler, Martin Shields, Hwayoung Jeon, and Michele Chait

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A20-88384

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/2335361")[doi.org/10.2172/2335361]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[The interplay of future solar energy, land cover change, and their projected impacts on natural lands and croplands in the US]

  ],
  right-content: [
    10\/15\/2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Jay Diffendorfer, Brian Sergi, Anthony Lopez, Travis Williams, Michael Gleason, Zach Ancona, Wesley Cole

#v(design-highlights-top-margin - design-text-leading)Science of the Total Environment 947, 173872

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.scitotenv.2024.173872")[doi.org/10.1016/j.scitotenv.2024.173872]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[System-cost-minimizing deployment of PV-wind hybrids in low-carbon U.S. power systems]

  ],
  right-content: [
    07\/01\/2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Patrick Brown, Travis Williams, Maxwell Brown, and Caitlin Murphy

#v(design-highlights-top-margin - design-text-leading)Applied Energy 365, 123151

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.apenergy.2024.123151")[doi.org/10.1016/j.apenergy.2024.123151]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Renewable Energy Technical Potential and Supply Curves for the Contiguous United States: 2024 Edition]

  ],
  right-content: [
    01\/07\/2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Anthony Lopez, Gabriel Zuckerman, Pavlo Pinchuk, Michael Gleason, Marie Rivers, Owen Roberts, Travis Williams, Donna Heimiller, Sophie-Min Thomson, Trieu Mai, and Wesley Cole

#v(design-highlights-top-margin - design-text-leading)National Rnewable Energy Laboratory, NREL\/TP-6A20-91900

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2172/2500362")[doi.org/10.2172/2500362]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Winds of Change: A Study of Future Wind Energy Resources and Cost Uncertainties Across the United States \(Under Review\)]

  ],
  right-content: [
    11\/20\/2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Grant Buster, Owen Roberts, Travis Williams, and Tyler Stehly

#v(design-highlights-top-margin - design-text-leading)Nature Energy])



== Extracurricular Activities


#one-col-entry(content: [#bullet-entry[Building PCs]])
#v(design-entries-vertical-space-between-entries)
#one-col-entry(content: [#bullet-entry[Linux]])


