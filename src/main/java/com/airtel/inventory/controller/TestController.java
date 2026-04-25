package com.airtel.inventory.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
     
	 @GetMapping("/test")
	    public String test() {
	        return "Inventory System is running!";
	    }
}
