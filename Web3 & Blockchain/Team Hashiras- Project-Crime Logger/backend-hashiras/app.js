const express = require('express');
const cors =  require('cors');

const app = express();

const citiesInIndia = [
  'Mumbai',
  'Delhi',
  'Bangalore',
  'Chennai',
  'Kolkata',
  'Hyderabad',
  'Ahmedabad',
  'Pune',
  'Surat',
  'Jaipur'
];
app.use(cors());
app.get('/cities', (req, res) => {
  res.json({ cities: citiesInIndia });
});

// Start the server on port 3000
const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});