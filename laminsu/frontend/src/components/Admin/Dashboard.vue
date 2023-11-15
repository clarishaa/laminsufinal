<template>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4 custom-top-margin ">
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body">Primary Card</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">View Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-warning text-white mb-4">
                            <div class="card-body">Warning Card</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">View Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">Success Card</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">View Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body">Danger Card</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">View Details</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Area Chart Example
                            </div>
                            <div class="card-body">
                                <canvas id="myAreaChart" width="100%" height="40"></canvas>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Bar Chart Example
                            </div>
                            <div class="card-body">
                                <canvas id="myBarChart" width="100%" height="40"></canvas>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="card mb-4">
    <div class="card-header">
      <i class="fas fa-table me-1"></i>
      DataTable Example
    </div>
    <div class="card-body">
      <table id="dataTable" class="table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>John Doe</td>
            <td>john@example.com</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Jane Doe</td>
            <td>jane@example.com</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Jane Doe</td>
            <td>jane@example.com</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Jane Doe</td>
            <td>jane@example.com</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Jane Doe</td>
            <td>jane@example.com</td>
          </tr>
          <!-- Add more rows as needed -->
        </tbody>
      </table>
    </div>
  </div>
            </div>
        </main>
    </div>
</template>
<script>
export default {
    mounted() {
        // Function to create a chart
        function createChart(chartType, canvasId, data) {
            var ctx = document.getElementById(canvasId).getContext('2d');
            var options = {
                scales: {
                    x: { beginAtZero: true },
                    y: { beginAtZero: true }
                }
            };

            new Chart(ctx, { type: chartType, data: data, options: options });
        }

        // Sample data for both charts
        var areaChartData = {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'Sample Data',
                backgroundColor: 'rgba(75,192,192,0.2)',
                borderColor: 'rgba(75,192,192,1)',
                borderWidth: 1,
                data: [65, 59, 80, 81, 56, 55, 40],
                fill: true,
            }]
        };

        var barChartData = {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'Sample Data',
                backgroundColor: 'rgba(75,192,192,0.2)',
                borderColor: 'rgba(75,192,192,1)',
                borderWidth: 1,
                data: [65, 59, 80, 81, 56, 55, 40],
            }]
        };

        // Create the area chart
        createChart('line', 'myAreaChart', areaChartData);

        // Create the bar chart
        createChart('bar', 'myBarChart', barChartData);
    }
};
</script>

<style scoped>
  .custom-top-margin {
    margin-top: 6rem; /* Adjust the value as needed */
  }
</style>