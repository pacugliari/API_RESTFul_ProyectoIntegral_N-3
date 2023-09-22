const { DataTypes } = require('sequelize');
const sequelize = require('../conexion/connection');

const Catalogo = sequelize.define('catalogo', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    poster: {
        type: DataTypes.STRING,
        allowNull: false
    },
    titulo: {
        type: DataTypes.STRING,
        allowNull: false
    },
    categoria: {
        type: DataTypes.STRING,
        allowNull: false
    },
    genero: {
        type: DataTypes.STRING,
        default: false
    },
    resumen: {
        type: DataTypes.STRING,
        allowNull: false
    },
    temporadas: {
        type: DataTypes.STRING,
        allowNull: false
    },
    reparto: {
        type: DataTypes.STRING,
        allowNull: false
    },
    trailer: {
        type: DataTypes.STRING,
        default: false
    }
}, {
    tableName: 'catalogo',
    timestamps: false
});

module.exports = Catalogo;