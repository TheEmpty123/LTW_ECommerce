package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.CodeString;
import com.example.ecommerce.Bean.Rating;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.RatingService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "rating", value = "/rating")
public class RatingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        User u = (User) session.getAttribute("auth");

        String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        Gson gson = new Gson();
        System.out.println(json);
        Rating rating = gson.fromJson(json, Rating.class);
        RatingService service = RatingService.getInstance();
        List<Rating> ratings = new ArrayList<>();

        double avgStars = 0.0;
        int onestars = 0;
        int twostars = 0;
        int threestars = 0;
        int fourstars = 0;
        int fivestars = 0;
        if (u != null) {
            try {
                boolean rowAffected = service.addRating(rating.getUserID(), rating.getProductID(), rating.getStars(), rating.getCommentRate(), LocalDateTime.now());
                System.out.println(rowAffected);
                ratings = service.getRatingByProductID(rating.getProductID());
                onestars = service.countStars(1,rating.getProductID());
                System.out.println(onestars);
                twostars = service.countStars(2,rating.getProductID());
                System.out.println(twostars);
                threestars = service.countStars(3,rating.getProductID());
                fourstars = service.countStars(4,rating.getProductID());
                fivestars = service.countStars(5,rating.getProductID());
                avgStars = (double) (onestars + 2*twostars + 3*threestars + 4*fourstars + 5*fivestars) / (onestars + twostars + threestars + fourstars + fivestars);
                System.out.println(onestars+ ","+twostars+","+threestars+","+fourstars+","+fivestars);
            } catch (Exception e) {
                System.out.println("Không lấy được đánh giá.");
            }
        }
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new MakeResult(ratings, avgStars,onestars,twostars,threestars,fourstars,fivestars, ratings.size())));
    }
    private class MakeResult{
        private List<Rating> ratings;
        private double avgStars;
        private int onestars;
        private int twostars;
        private int threestars;
        private int fourstars;
        private int fivestars;
        private int totalRate;

        public MakeResult(List<Rating> ratings, double avgStars, int onestars, int twostars, int threestars, int fourstars, int fivestars, int totalRate) {
            this.ratings = ratings;
            this.avgStars = avgStars;
            this.onestars = onestars;
            this.twostars = twostars;
            this.threestars = threestars;
            this.fourstars = fourstars;
            this.fivestars = fivestars;
            this.totalRate = totalRate;
        }

        public List<Rating> getRatings() {
            return ratings;
        }

        public double getAvgStars() {
            return avgStars;
        }

        public int getOnestars() {
            return onestars;
        }

        public int getTwostars() {
            return twostars;
        }

        public int getThreestars() {
            return threestars;
        }

        public int getFourstars() {
            return fourstars;
        }

        public int getFivestars() {
            return fivestars;
        }
        public int getTotalRate() {
            return totalRate;
        }
    }
}
