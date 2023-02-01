import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Import and register TailwindCSS Components
import { Alert, Slideover } from "tailwindcss-stimulus-components"
application.register('slideover', Slideover)
application.register('alert', Alert)

export { application }
