const mysql = require('mysql2');
require('dotenv').config();

// Crear pool de conexiones (mejor rendimiento)

// const pool = mysql.createPool({
//   host: process.env.DB_HOST,
//   user: process.env.DB_USER,
//   password: process.env.DB_PASSWORD,
//   database: process.env.DB_NAME,
//   waitForConnections: true,
//   connectionLimit: 10,
//   queueLimit: 0
// });

const pool = mysql.createPool({
  host: 'esteticaleo.com', // Cambiamos la IP por el dominio
  port: 3306,             // Forzamos el puerto estándar
  user: 'estet1caleos_sistema', 
  password: 'sistemaleos12345!', 
  database: 'estet1caleos_estetica_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  // ESTA LÍNEA ES CLAVE para servidores de cPanel:
  connectTimeout: 10000 
});

// Usar promesas en lugar de callbacks
const promisePool = pool.promise();

// Verificar conexión
pool.getConnection((err, connection) => {
  if (err) {
    console.error('❌ Error conectando a la BD:', err.message);
  } else {
    console.log('✅ Conexión exitosa a MySQL');
    connection.release();
  }
});

//module.exports = promisePool;

module.exports = pool.promise();
