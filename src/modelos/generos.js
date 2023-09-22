const { DataTypes } = require('sequelize');
const sequelize = require('../conexion/connection');

const Generos = sequelize.define('generos', {
    idGenero: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    descripcion: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: 'generos',
    timestamps: false
});

module.exports = Generos;