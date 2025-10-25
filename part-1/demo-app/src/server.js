const express  = require('express');
const os = require('os');

const hostname = os.hostname();

const app = express();
const port = process.env.NODE_PORT || 3000;

app.get('/', (req, res) => {
  const clientIp = req.headers['x-forwarded-for'] || req.connection.remoteAddress || req.ip;
  console.log(`${new Date().toISOString()} [INFO] Request received from "${clientIp}" for "${req.url}"`);
  res.json({
    hostname: hostname
  });
});

app.listen(port, () => {
  console.log(`Server running at http://<HOST>:${port}/`);
});
