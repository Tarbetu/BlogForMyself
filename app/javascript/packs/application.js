import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { Turbo, cable } from "@hotwired/turbo-rails"
import "../controllers"
import "../layouts/application.css"

require("trix")
require("@rails/actiontext")


ActiveStorage.start()
