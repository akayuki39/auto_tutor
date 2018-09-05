function draw_pie(data) {
  var chart = nv.models.pieChart()
      .x(function(d) { return d.label })
      .y(function(d) { return d.value })
      .showLabels(true);

    d3.select("#chart svg")
        .datum(data)
      .transition().duration(1200)
        .call(chart);

  return chart;
}

function error() {
    console.log("error")
}

function draw_bar(data) {
  var chart = nv.models.multiBarHorizontalChart()
      .x(function(d) { return d.label })
      .y(function(d) { return d.value })
      .margin({top: 30, right: 20, bottom: 50, left: 175})
      .showValues(true)
      .tooltips(false)
      .showControls(false);

  chart.yAxis
      .tickFormat(d3.format(',.2f'));

  d3.select('#chart svg')
      .datum(data)
    .transition().duration(500)
      .call(chart);

  nv.utils.windowResize(chart.update);

  return chart;
};

