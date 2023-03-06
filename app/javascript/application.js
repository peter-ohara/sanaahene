// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import "chartkick"
import Highcharts from "highcharts"

window.Highcharts = Highcharts



Chartkick.options = {
    library: {
        chart: {
            zoomType: 'x',
            scrollablePlotArea: {
                minWidth: 640
            }
        }
    }
}