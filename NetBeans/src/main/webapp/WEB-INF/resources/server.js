var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io=require('socket.io').listen(server);
users = [];
connections = [];

server.listen(process.env.PORT || 3000);

console.log('Servidor corriendo ... ');

app.get('/',function(req,res){
        res.sendFile(__dirname + '/index.html');
        console.log('Lanzado el Html');
    console.log('La weba cuantica')
        });

io.sockets.on('connection', function (socket){    
    socket.on('Enviar', function(data){
        io.sockets.emit('new message',{msg:data});
        console.log('Recivido y enviado');
    });
    
  
});


