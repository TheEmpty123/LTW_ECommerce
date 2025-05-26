package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Utils.CipherUtils;
import com.example.ecommerce.service.OrderService;
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

@WebServlet(name = "Signature", value = "/signature")
public class SignatureController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService = OrderService.getInstance();
        HttpSession session = req.getSession();
        BufferedReader reader = req.getReader();
        StringBuilder json = new StringBuilder();
        String line;

        User u = (User) session.getAttribute("auth");

        while ((line = reader.readLine()) != null) {
            json.append(line);
        }
        try {
            String requestBody = json.toString();
            System.out.println("Request Body: " + requestBody);

            JSONObject obj = new JSONObject(requestBody);
            String signature = obj.getString("signature");
            String hashCode = obj.getString("hashcode");

            System.out.println("signature: " + signature);
            System.out.println("hashCode: " + hashCode);
            int currOrderId = Integer.parseInt(session.getAttribute("currOrderId").toString());

            PrintWriter out = resp.getWriter();

            boolean checkVerify = CipherUtils.verify(hashCode, signature, u.getPublic_key());
            System.out.println(checkVerify);
            if (checkVerify) {
                orderService.updateSignature(currOrderId, signature);
                out.print(currOrderId);
            } else {
                out.print("Fail");
            }
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
