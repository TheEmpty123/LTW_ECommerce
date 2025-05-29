package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdatePublicKey", value = "/update-key")
public class UpdatePublicKeyController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = UserService.getInstance();
        HttpSession session = req.getSession();

        BufferedReader reader = req.getReader();
        StringBuilder json = new StringBuilder();
        String line;

        User u = (User) session.getAttribute("auth");

        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

       try{
           String requestBody = json.toString();

           JSONObject obj = new JSONObject(requestBody);
           String publicKey = obj.getString("inputKey");

           boolean updated = userService.updatePublicKey(u.getId(), publicKey);

           PrintWriter out = resp.getWriter();
           if(updated){
               out.print("Success");
           }else out.print("Failed");
           out.flush();

       }catch (Exception e){
           e.printStackTrace();
       }
    }
}
