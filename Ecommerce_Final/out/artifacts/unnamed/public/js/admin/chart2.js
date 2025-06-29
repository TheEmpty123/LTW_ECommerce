var ctx2 = document.getElementById('total-revenue').getContext('2d');

var myChart2 = new Chart(ctx2, {
  type: 'line',
  data: {
    labels: label2,
    datasets: [{
      label: '# total sales',
      data: data2,
      borderWidth: 5,
      tension: 0.2
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});