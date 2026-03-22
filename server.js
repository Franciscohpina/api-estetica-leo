const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();
const bcrypt = require('bcrypt');

// 1. Importamos la base de datos y los controladores
const db = require('./config/database'); 
const authController = require('./controllers/authController'); 

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// --- RUTAS DE AUTENTICACIÓN ---
// Aquí usamos directamente las funciones de tu authController
app.post('/api/login', authController.login);
app.post('/api/registrar', authController.registrarEstilista);

// --- OTRAS RUTAS ---
app.use('/api/clientes', require('./routes/clienteRoutes'));
app.use('/api/estado', require('./routes/estadoRoutes'));
app.use('/api/visitas', require('./routes/visitaRoutes'));

try {
  const agendaRoutes = require('./routes/agendaRoutes');
  app.use('/api/agenda', agendaRoutes);
} catch (err) {
  console.error("Error cargando agendaRoutes:", err);
}

// Rutas directas para estilistas y servicios
app.get('/api/estilistas', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT id, nombre FROM estilistas ORDER BY nombre ASC');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.get('/api/servicios', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT id, nombre, precio FROM servicios ORDER BY nombre ASC');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.get('/', (req, res) => {
  res.json({ mensaje: 'API Estética funcionando correctamente' });
});

// Manejo de errores
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Algo salió mal!' });
});

// RUTA DE MANTENIMIENTO (Solo para arreglar los hashes actuales)
app.get('/api/mantenimiento/reset-passwords', async (req, res) => {
    try {
        const [usuarios] = await db.query('SELECT id, pass_hash FROM estilistas');
        for (let u of usuarios) {
            if (!u.pass_hash.startsWith('$2b$')) {
                const nuevoHash = await bcrypt.hash(u.pass_hash, 10);
                await db.query('UPDATE estilistas SET pass_hash = ? WHERE id = ?', [nuevoHash, u.id]);
            }
        }
        res.send("¡Listo! Hashes actualizados.");
    } catch (error) {
        res.status(500).send("Error: " + error.message);
    }
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});