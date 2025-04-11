const mongoose = require('mongoose');

const connection = mongoose.createConnection(`mongodb+srv://vikrant:vikrant@cluster0.ac8y3b6.mongodb.net/RBL`).on('open', () => {
    console.log('Database connected');
}).on('error', (err) => {
    console.log(`Error: ${err}`);
});

module.exports = connection;