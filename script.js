// This calls the future Azure Function
fetch("https://your-api-endpoint/api/visitorCount")
  .then(response => response.json())
  .then(data => {
    document.getElementById("visitor-count").innerText = data.count;
  })
  .catch(error => {
    console.error('Error fetching visitor count:', error);
  });