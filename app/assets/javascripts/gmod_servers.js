// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function(){
  function ready()
  {
    $('table.viz').each(function(index){
      var id = $(this).attr("data-id");
      var table = $(this)[0];
      var chartWidth = $(this).css("width");
      $(this).hide();
      $.ajax({
        dataType: "json",
        url: "/servers/" + id + ".json",
        success: function( data ) {
          var categories = data.categories;
          var series1 = data.playercounts;
          var series2 = data.pings;

          var container = document.createElement( "div" );
          $(container).css({
            minWidth: chartWidth,
            height: '350px',
            margin: '0 auto'
          }).highcharts({
            chart: { zoomType: 'xy', type: 'column' },
            //data: { table: dataTable },
            xAxis: [{
              categories: categories
            }],
            yAxis: [{
              allowDecimals: false,
              title: {
                text: 'Players'
              }
            },
            {
              allowDecimals: false,
              title: {
                text: 'Milliseconds'
              },
              labels: {
                  format: '{value} ms',
                  style: {
                      color: '#4572A7'
                  }
              },
              opposite: true
            }],
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 120,
                verticalAlign: 'top',
                y: 100,
                floating: true,
                backgroundColor: '#FFFFFF'
            },
            series: [{
                name: 'Player Count',
                color: '#4572A7',
                type: 'column',
                data: series1
            }, {
                name: 'Ping',
                type: 'spline',
                color: '#AA4643',
                yAxis: 1,
                marker: {
                    enabled: false
                },
                dashStyle: 'shortdot',
                tooltip: {
                    valueSuffix: ' ms'
                },
                data: series2

            }]
          });
          $(container).insertAfter( table );
        }
      });
    });
  }

  $(document).ready(ready);
  $(document).on("page:load", ready);
})();

$(document).on("page:load",function(){
  //$('table.viz').hide().highchartTable();


});