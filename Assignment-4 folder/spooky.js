const express = require('express');
const mysql = require('mysql2');
const dotenv = require('dotenv');

dotenv.config();

const app = express(); // Initialize app first
const PORT = 3000;

app.use(express.json()); // Middleware to parse JSON, placed after app is initialized



// Connection to the database
const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

// Root GET route
app.get('/', (req, res) => {
    res.send('Welcome to the spooky house');
});

// POST route to create a new character
app.post('/create-character', (req, res) => {
    const { firstName, lastName, age, hobbies, superpower, passion } = req.body;

    const sql = 'INSERT INTO spooky_characters (firstName, lastName, age, hobbies, superpower, passion) VALUES (?, ?, ?, ?, ?, ?)';
    
    pool.query(sql, [firstName, lastName, age, hobbies, superpower, passion], (err, result) => {
        if (err) {
            console.error('Error inserting character:', err.message);
            return res.status(500).json({ error: 'Database error' });
        }
        
        res.status(201).json({ id: result.insertId, message: `User ${firstName} ${lastName} created successfully` });
    });
});

// GET route to list all characters
app.get('/character-list', (req, res) => {
    const sql = 'SELECT * FROM spooky_characters';
    
    pool.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching characters:', err.message);
            return res.status(500).json({ error: 'Database error' });
        }
        
        res.status(200).json(results);
    });
});

// GET: Retrieve a character by ID
app.get('/character/:id', (req, res) => {
  const characterId = req.params.id;

  if (!Number(characterId)) {
      return res.status(400).json({ error: 'Invalid character ID' });
  }

  const sql = 'SELECT * FROM spooky_characters WHERE id = ?';
  pool.query(sql, [characterId], (err, results) => {
      if (err) {
          console.error('Error retrieving character:', err.message);
          return res.status(500).json({ error: 'Database error' });
      }

      if (results.length === 0) {
          return res.status(404).json({ message: `Character with ID ${characterId} not found` });
      }

      res.status(200).json(results[0]);
  });
});

// additional GET route to filter characters by superpower
app.get('/characters-by-superpower/:superpower', (req, res) => {
    const superpower = req.params.superpower;

    const sql = 'SELECT * FROM spooky_characters WHERE superpower = ?';
    pool.query(sql, [superpower], (err, results) => {
        if (err) {
            console.error('Error fetching characters by superpower:', err.message);
            return res.status(500).json({ error: 'Database error' });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: `No characters found with superpower: ${superpower}` });
        }

        res.status(200).json(results);
    });
});

// PUT route to update a character by ID
app.put('/update-character/:id', (req, res) => {
    const id = req.params.id;
    const { firstName, lastName, age, hobbies, superpower, passion } = req.body;

    const sql = 'UPDATE spooky_characters SET firstName = ?, lastName = ?, age = ?, hobbies = ?, superpower = ?, passion = ? WHERE id = ?';
    
    pool.query(sql, [firstName, lastName, age, hobbies, superpower, passion, id], (err, result) => {
        if (err) {
            console.error('Error updating character:', err.message);
            return res.status(500).json({ error: 'Database error' });
        }
        
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Character not found' });
        }
        
        res.status(200).json({ message: `Character with ID ${id} updated successfully` });
    });
});

// // DELETE route to delete a character by ID
app.delete('/delete-character/:id', (req, res) => {
  const userId = req.params.id;

  const sql = 'DELETE FROM spooky_characters WHERE id = ?';

  pool.query(sql, [userId], (err, result) => {
      if (err) {
          console.error('Error deleting character:', err.message);
          return res.status(500).json({ error: 'Database error' });
      }

      if (result.affectedRows === 0) {
          return res.status(404).json({ message: `Character with ID ${userId} not found` });
      }

      res.status(200).json({ message: `Character with ID ${userId} has been deleted successfully` });
  });
});