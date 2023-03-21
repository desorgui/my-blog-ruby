// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@rails/actiontext"
import "trix"

document.addEventListener("DOMContentLoaded", function() {
  var editor = document.querySelector("[data-trix-editor]")
  var trix = new Trix.Editor(editor)
})