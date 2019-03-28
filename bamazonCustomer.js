//requiring the mysql npm module

const mysql = require("mysql");

//creating the connection to the SQL database:

var connection = mysql.createConnection({
    host: "localhost",
  
    // Your port:
    port: 3306,
  
    // Your username:
    user: "root",
  
    // Your password:
    password: "password2",
    database: "bamazon_db"
  });

  //from the mysql npm documentation; getting the connection ID:
  connection.connect(function(err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
  afterConnection();
});

function afterConnection() {
  connection.query("SELECT * FROM products", function(err, res) {
    if (err) throw err;
    console.log(res);
    connection.end();
  });
}

  
  