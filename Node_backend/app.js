const express = require('express');
const cors = require('cors');
const body_parser = require('body-parser');
const actRouter = require('./routes/act_routes');

const app = express();

app.use(body_parser.json());
app.use(cors());

app.use('/act', actRouter);

module.exports = app;