<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sentiment Analysis Result</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
    /* Styles for the canvas element containing the pie chart */
#sentimentChart {
         
   margin-left: 500px;
   position:absolute;
   top:40px;/* Ensure the chart is above other elements */
}


    </style>
</head>
<body>
    <h1><u>Sentiment Analysis Result</u></h1>
      <h2>Total sentences :<%= request.getAttribute("totalSentences") %></h2>
  
    <h2>PostivePercentage :<%= request.getAttribute("positivePercentage") %>%</h2>
     <h2>NegativePercentage :<%= request.getAttribute("negativePercentage") %>%</h2>
      <h2>NeutralPercentage :<%= request.getAttribute("neutralPercentage") %>%</h2>

    <canvas id="sentimentChart" width="550" height="400"></canvas>

    <script>
        var ctx = document.getElementById('sentimentChart').getContext('2d');
        var chartData = {
            labels: ['Positive', 'Negative', 'Neutral'],
            datasets: [{
                label: 'Sentiment Distribution',
                data: [<%= request.getAttribute("positivePercentage") %>, <%= request.getAttribute("negativePercentage") %>, <%= request.getAttribute("neutralPercentage") %>],
                backgroundColor: [
                    'rgba(75, 192, 192, 0.6)',
                    'rgba(255, 99, 132, 0.6)',
                    'rgba(255, 206, 86, 0.6)'
                ],
                borderColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(255, 206, 86, 1)'
                ],
                borderWidth: 1
            }]
        };

        var chartOptions = {
            responsive: false,
            maintainAspectRatio: false
        };

        var chart = new Chart(ctx, {
            type: 'pie',
            data: chartData,
            options: chartOptions
        });
    </script>
</body>
</html>

