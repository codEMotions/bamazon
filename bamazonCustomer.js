//requiring the mysql npm module

const mysql = require("mysql");
const inquirer = require("inquirer");

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

//From the mysql npm documentation; getting the connection ID:
connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
  afterConnection();
});

// Establishing a global variable for updated inventory:
let currentInventory = []

//Getting everything from the products table, activating the connection, and displaying through the terminal all of the available bamazon products:
function afterConnection() {
  connection.query("SELECT * FROM products", function (err, res) {
    if (err) throw err;
    console.log(res);
    currentInventory = res;
    for (i = 0; i < res.length; i++) {
      console.log("Item ID: " + res[i].item_id, "|| Product: " + res[i].product_name, "|| Price: " + res[i].price)
    }
    //Invoking the "inquirer" module to ask the customer which products they want to buy and the quantity of the product:
    inquirer
      .prompt([
        {
          name: "productChoice",
          type: "input",
          message: "Which product would you like to purchase?",
          validate: function (value) {
            if (isNaN(value) === false) {
              return true;
            }
            return false;
          }
        },

        {
          name: "quantity",
          type: "input",
          message: "What's the quantity of this product you'd like to purchase?",
          validate: function (value) {
            if (isNaN(value) === false) {
              return true;
            }
            return false;
          }
        }
      ])

      // Once the user enters numbers representing the item ID and quantity, the terminal calls back a confirmation of the product chosen, the quantity of the product chosen, and the remaining inventory of the product:
      .then(function (answer) {
        console.log(answer)
        let productChoice = parseInt(answer.productChoice);
        let quantity = parseInt(answer.quantity);
        let updatedInventory = 0;

        for (i = 0; i < currentInventory.length; i++) {
          if (productChoice === currentInventory[i].item_id) {
            updatedInventory = currentInventory[i].stock_quantity - quantity
          }
          
        }
        console.log("Your order has been placed!");
        console.log("You ordered a total set of " + quantity + " from Item ID #" + productChoice)

        connection.query(
          "UPDATE products SET ? WHERE ?",
          [
            {
              stock_quantity: updatedInventory
            },
            {
              item_id: productChoice
            }
          ],
          function (error) {
            if (error) { console.log(error) }
            console.log("There are " + updatedInventory + " left in stock.");
            connection.end(); //ends the connection. 
          }
        );
      })
  });
}



