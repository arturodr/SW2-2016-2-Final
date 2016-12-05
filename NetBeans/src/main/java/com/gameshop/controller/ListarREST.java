/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gameshop.controller;

import com.gameshop.model.bean.MsjChat;
import com.gameshop.model.dao.ChatDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
public class ListarREST {

    @Autowired
    private ChatDAO chatDAO;

    @RequestMapping(value = "/chat/", method = RequestMethod.GET)
    public ResponseEntity<List<MsjChat>> listChat() {
        List<MsjChat> chatList = chatDAO.list();
        return new ResponseEntity<List<MsjChat>>(chatList, HttpStatus.OK);
    }

    @RequestMapping(value = "/chat/", method = RequestMethod.POST)
    public ResponseEntity<Void> createMsj(@RequestBody MsjChat msj, UriComponentsBuilder ucBuilder) {
        int key = chatDAO.insertt(msj);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/chat/{id}").buildAndExpand(key).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
}
