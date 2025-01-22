//const express = require('express');

// create this configuration in package (type) json to handle import
import express from "express";
import dotenv from "dotenv";
import path from "path";
import cors from 'cors';

import { connectDB } from "./config/db.js";


dotenv.config();

import productRoutes from "./routes/product.route.js"


const app = express();
const PORT = process.env.PORT || 5000;

const __dirname = path.resolve();

// Middleware para permitir todos los orígenes
app.use(cors({
    origin: 'http://localhost', // Cambia por el dominio de tu frontend
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    credentials: true, // Si usas cookies o autenticación
}));

app.use(express.json()); // allows us to accept JSON data in the req.body

app.use("/api/products", productRoutes )

// if (process.env.NODE_ENV === "production") {
// 	app.use(express.static(path.join(__dirname, "/frontend/dist")));
// 	app.get("*", (req, res) => {
// 		res.sendFile(path.resolve(__dirname, "frontend", "dist", "index.html"));
// 	});
// }

app.listen(5000, () =>{
    connectDB();
    console.log("Server started at http://localhost:" + PORT);
})