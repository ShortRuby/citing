# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", preload: true, to: "turbo.min.js"
pin "@hotwired/stimulus", preload: true, to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", preload: true, to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
