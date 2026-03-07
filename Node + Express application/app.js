const express = require("express");
const path = require("path");
const venueRoutes = require("./routes/venues");
const showRoutes = require("./routes/shows");

const app = express();
const PORT = process.env.PORT || 3000;

// Set EJS as templating engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));

// Home page
app.get("/", (req, res) => {
  res.render("index");
});

// Routes
app.use("/venues", venueRoutes);
app.use("/shows", showRoutes);

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});