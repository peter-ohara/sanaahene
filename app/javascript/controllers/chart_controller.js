import { Controller } from "@hotwired/stimulus"
import Highcharts from 'highcharts'


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
        series: Array,
        title: String,
        type: String,
    }

    static targets = ["chartArea", "date", "used", "purchased", "balance" ]

    connect() {
        const data = this.seriesValue
        const title = this.titleValue
        const chartType = this.typeValue
        const dateTarget = this.dateTarget
        const usedTarget = this.usedTarget
        const purchasedTarget = this.purchasedTarget
        const balanceTarget = this.balanceTarget
        const chartArea = this.chartAreaTarget

        Highcharts.chart(chartArea, {
            chart: {
                type: chartType,
                zoomType: 'x',
                scrollablePlotArea: {
                    minWidth: 640
                }
            },
            title: {
                text: title,
            },
            xAxis: {
                categories: getCategories(data)
            },
            yAxis: {
                title: false
            },
            series: [{
                name: "Electricity Used",
                showInLegend: false,
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
                    pointWidth: 19,
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
