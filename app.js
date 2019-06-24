const util = require('util');
const { exec } = require('child_process');
const express = require('express');

const execPromisify = util.promisify(exec);

const runCmd = async (repo, name, tag = 'latest') => {
  const { stdout, stderr } = await execPromisify(
    `./deploy.sh ${repo} ${name} ${tag}`,
  );
  console.log('============');
  console.log(stdout);
  console.log('============');
  console.log(stderr);
};

const app = express();
app.get('/', async (req, res) => {
  const { repo, name, tag = 'latest' } = req.query;
  if (!repo || !name) {
    res.send({ success: false, desc: 'invalid project name', code: 14000 });
    return res.end();
  }
  await runCmd(repo, name, tag);
  res.send({ success: true });
  return res.end();
});

app.listen(9000);
