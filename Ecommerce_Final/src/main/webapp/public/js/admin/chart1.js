const ctx = document.getElementById('order-status');

new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ['Packaging', 'Delivering', 'Processed'],
    datasets: [{
      label: ' #% total order',
      data: [30, 33, 37],
      backgroundColor: [
        'rgb(255, 178, 102)',
        'rgb(54, 162, 235)',
        'rgb(102, 255, 102)'
      ]
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