const app = require('./app');
const db = require('./config/db');
const actModel = require('./model/act_model');

const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.status(200).json({ message: 'Hello from the server side!!!' });
});


// Time pass
app.get('/pokemon', (req, res) => {
    res.status(200).json({ name: 'Pikachu', type: 'Electric', level: 50, ability: 'Thunderbolt', weakness: 'Ground' });
});

app.listen(port, () => {
    console.log(`App running on port http://localhost:${port}`);
});