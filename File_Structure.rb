├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   └── application_controller.rb
        └── drawings_controller.rb
        └── artist_controller.rb
│   ├── models
│   │   ├── drawings.rb
│   │   └── artist.rb
│   └── views
│       ├── index.erb
│       ├── layout.erb
│       ├── drawing
│       │   ├── create_drawing.erb
│       │   ├── edit_drawing.erb
│       │   ├── show_drawing.erb
│       │   └── drawing.erb
│       └── artists
│           ├── create_artist.erb
│           └── login.erb
│           └── show.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 01_create_artists.rb
│   │   └── 02_create_drawings.rb
│   ├── schema.rb
│   └── test.sqlite
└── spec
├── controllers
│   └── application_controller_spec.rb
└── spec_helper.rb
