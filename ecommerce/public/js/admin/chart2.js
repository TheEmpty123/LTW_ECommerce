var ctx2 = document.getElementById('total-revenue').getContext('2d');

var myChart2 = new Chart(ctx2, {
  type: 'line',
  data: {
    labels: ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [{
      label: '# total sales',
      data: [15000000, 13000000, 15000000, 9900000, 7200000],
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