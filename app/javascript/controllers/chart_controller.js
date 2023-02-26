import { Controller } from "@hotwired/stimulus"
import Highcharts from 'highcharts'
import exporting from "highcharts/modules/exporting"
import offlineExporting from "highcharts/modules/offline-exporting"


exporting(Highcharts)
offlineExporting(Highcharts)


function getCategories(data) {
    return data.map((entry) => {
        const date = new Date(entry.date)
        return date.toLocaleString("en-Us", {month: "short", day: "numeric"})
    })
}

function getSeries(data) {
    return data.map((entry) => parseFloat(entry.used))
}

export default class extends Controller {
    static values = {
        series: Array
    }
    static targets = ["chartArea", "date", "used", "purchased", "balance" ]

    connect() {
        const data = this.seriesValue
        const dateTarget = this.dateTarget
        const usedTarget = this.usedTarget
        const purchasedTarget = this.purchasedTarget
        const balanceTarget = this.balanceTarget
        const chartArea = this.chartAreaTarget

        const chart = Highcharts.chart(chartArea, {
            chart: {
                type: 'column',
                zoomType: 'x',
                scrollablePlotArea: {
                    minWidth: 640
                }
            },
            title: false,
            xAxis: {
                categories: getCategories(data)
            },
            yAxis: {
                title: false
            },
            series: [{
                name: "Electricity Used",
                data: getSeries(data),
                allowPointSelect: true,
                states: {
                    select: {
                        color: 'red',
                    }
                }
            }],
            plotOptions: {
                series: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function () {
                                dateTarget.textContent = data[this.index].date
                                usedTarget.textContent = data[this.index].used
                                purchasedTarget.textContent = data[this.index].purchased
                                balanceTarget.textContent = data[this.index].balance
                            }
                        }
                    }
                }
            }
        });
    }
}
