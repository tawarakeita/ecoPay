// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// If you want to use a third-party Tabs controller (e.g. tailwindcss-stimulus-components),
// register it here. Currently we rely on local controllers in `app/javascript/controllers/*`.
