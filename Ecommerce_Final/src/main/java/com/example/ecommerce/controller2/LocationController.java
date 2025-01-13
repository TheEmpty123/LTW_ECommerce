package com.example.ecommerce.controller2;

import com.example.ecommerce.Location.Location;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.nio.charset.StandardCharsets;

@WebServlet("/locations")
public class LocationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Correct relative path
        InputStream inputStream = getServletContext().getResourceAsStream("/public/json/vietnam.json");
        if (inputStream == null) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("Error: Unable to find vietnam.json");
            return;
        }

        String json = new String(inputStream.readAllBytes(), StandardCharsets.UTF_8);

        Gson gson = new Gson();
        Location location = gson.fromJson(json, Location.class);

        resp.setContentType("application/json");
        resp.getWriter().write(gson.toJson(location));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
