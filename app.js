const util = require('util');
const { exec } = require('child_process');
const express = require('express');

const execPromisify = util.promisify(exec);

const runCmd = async name => {
  const { stdout, stderr } = await execPromisify(`./deploy.sh ${name}`);
  console.log('============');
  console.log(stdout);
  console.log('============');
  console.log(stderr);
};

const app = express();
app.get('/', async (req, res) => {
  const { project } = req.query;
  if (!project) {
    res.send({ success: false, desc: 'invalid project name', code: 14000 });
    return res.end();
  }
  if (!project.include(':')) {
    res.send({ success: false, desc: 'invalid project name', code: 14001 });
    return res.end();
  }
  await runCmd(project);
  res.send({ success: true });
  return res.end();
});

app.listen(9000);
