const { DataTypes } = require('sequelize');
const sequelize = require('../conexion/connection');

const Categorias = sequelize.define('categorias', {
    idCategoria: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    descripcion: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: 'categorias',
    timestamps: false
});

module.exports = Categorias;
