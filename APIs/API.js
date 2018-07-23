const express = require('express');
const app = express();
const request = require("request");
var mysql = require('mysql');
var bodyParser = require('body-parser');
const dbConfig = require('./config.js');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//Connect to Database
var connection = mysql.createConnection({
    host     : dbConfig.host,
    user     : dbConfig.user,
    password :  dbConfig.password,
    database :  dbConfig.database
});
connection.connect()


//Arrays to Hold Data
var values = [];
var data = [];
var arr=[];


//Fetching Data From Source and Insert Into Database
request({uri: "https://api.myjson.com/bins/b9ix6"},
    function(error, response, body) {
        arr = JSON.parse(body);
        for(var x in arr){
            values.push(arr[x]);
        }
        for(var i=0; i< values.length; i++)
           for(var j=0; j<values[i].length ; j++)
            data.push([values[i][j].driverName,values[i][j].courier,values[i][j].deliveryDate,values[i][j].fromLocation,values[i][j].toLocation,values[i][j].status,values[i][j].description]);

    });



// Inserts Data From Uri Sources
app.get('/insert', function(req, res) {
connection.query('INSERT INTO  tasks (driverName, courier, deliveryDate, fromLocation, toLocation, status, description) VALUES ?', [data], function(err,result) {
    if(err) {
        res.send('Error');
    }
    else {
        res.send('Success');
    }

});
    connection.end()
});

/// Reterive Data From DataBase

app.get('/tasks', function(req, res) {
    connection.query('Select * From tasks', function(err,result) {
        if(err) {
            res.send(err);
        }
        else {
            res.setHeader('Access-Control-Allow-Origin', '*');
            res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'); // If needed
            res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type'); // If needed
            res.json(result);

        }

    });
});

//Searching into Database

app.get('/tasks/search/:keyword', function(req, res) {
    connection.query("SELECT * FROM tasks WHERE driverName LIKE ? OR courier LIKE ?  OR status LIKE ?", ['%' + req.params.keyword + '%' ,'%' + req.params.keyword + '%','%' + req.params.keyword + '%'], function(err,result) {

        if(err) {
            res.send(err);
        }
        else {
            res.setHeader('Access-Control-Allow-Origin', '*');
            res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'); // If needed
            res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type'); // If needed
            res.json(result);
        }

    });
});



//rest api to get a single Task data
app.get('/tasks/:id', function (req, res) {
    connection.query('select * from tasks where Id=?', [req.params.id], function (error, result) {
        if(error) {
            res.send(error);
        }else {
            res.setHeader('Access-Control-Allow-Origin', '*');
            res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'); // If needed
            res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type'); // If needed
            res.send(JSON.stringify(result[0]));
        }
    });
});



//rest api to update record into mysql database
app.put('/task', function (req, res) {
    connection.query('UPDATE `tasks` SET `status`=? where `id`=?', ['completed', req.body.Id], function (error, result) {
        if(error) {
            res.send(error);
        }else {
            res.setHeader('Access-Control-Allow-Origin', '*');
            res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'); // If needed
            res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type'); // If needed
            res.setHeader("Access-Control-Expose-Headers", "Access-Control-*");
            res.setHeader("Access-Control-Allow-Headers", "Access-Control-*, Origin, X-Requested-With, Content-Type, Accept");
            res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS, HEAD');
            res.setHeader('Allow', 'GET, POST, PUT, DELETE, OPTIONS, HEAD');
            res.end('successs');
        }


    });
});
//rest api to Delete record From mysql database
app.delete('/task/:id', function (req, res) {
    connection.query('delete from `tasks`  where `Id`=?', [req.body.Id], function (error, results, fields) {
        if (error) throw error;
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'); // If needed
        res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type'); // If needed


        res.end(JSON.stringify(results));
    });
});
app.listen(9999, () => console.log('Wimo listening on port 9999 !'))
