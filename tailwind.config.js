module.exports = {
  theme: {
    fontFamily: {
      sans: ["Roboto", "sans-serif"],
      serif: ["Roboto Slab", "serif"],
      body: ["Roboto", "sans-serif"],
    },
    extend: {
      boxShadow: {
        't': '0px 0 10px rgba(0 0 0 / 0.1)'
      }
    }
  },
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.html.slim',
    './app/views/**/*.slim',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ]
}
