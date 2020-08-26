const express = require('express');

const app = express();
app.get('/', async (req, res) => {
  res.send({ success: true, data: 'hello, deploy successfully' });
  return res.end();
});

app.listen(9000);
