package com.company.controller;

import com.company.model.Numbers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class OpController {


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }


    @RequestMapping(value = "/topla.html", method = RequestMethod.POST)
    public
    @ResponseBody
    Numbers topla(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Numbers numbers = new Numbers();
        numbers.setFirstNum(Integer.parseInt(request.getParameter("firstNum")));
        numbers.setSecNum(Integer.parseInt(request.getParameter("secNum")));
        numbers.setResult((double) (numbers.getFirstNum() + numbers.getSecNum()));
        return numbers;
    }


    @RequestMapping(value = "/cikar.html", method = RequestMethod.POST)
    public
    @ResponseBody
    Numbers cikar(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Numbers numbers = new Numbers();
        numbers.setFirstNum(Integer.parseInt(request.getParameter("firstNum")));
        numbers.setSecNum(Integer.parseInt(request.getParameter("secNum")));
        numbers.setResult((double) (numbers.getFirstNum() - numbers.getSecNum()));
        return numbers;
    }


    @RequestMapping(value = "/carp.html", method = RequestMethod.POST)
    public
    @ResponseBody
    Numbers carp(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Numbers numbers = new Numbers();
        numbers.setFirstNum(Integer.parseInt(request.getParameter("firstNum")));
        numbers.setSecNum(Integer.parseInt(request.getParameter("secNum")));
        numbers.setResult((double) (numbers.getFirstNum() * numbers.getSecNum()));
        return numbers;
    }



    @RequestMapping(value = "/bol.html", method = RequestMethod.POST)
    public
    @ResponseBody
    Numbers bol(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Numbers numbers = new Numbers();
        numbers.setFirstNum(Integer.parseInt(request.getParameter("firstNum")));
        numbers.setSecNum(Integer.parseInt(request.getParameter("secNum")));
        numbers.setResult((double) (numbers.getFirstNum() / numbers.getSecNum()));
        return numbers;
    }


}