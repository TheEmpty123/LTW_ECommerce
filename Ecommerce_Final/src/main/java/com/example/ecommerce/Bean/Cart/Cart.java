package com.example.ecommerce.Bean.Cart;

import com.example.ecommerce.Bean.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class Cart {
    private Map<Integer, CartProduct> data = new HashMap<Integer, CartProduct>();

    public boolean add(Product p){
        if(data.containsKey(p.getId())) return update(p.getId(), data.get(p.getId()).getQuantity()+1);
        data.put(p.getId(), convert(p));
        return true;
    }

    //cap nhat so luong san pham trong gio hang
    public boolean update(int id, int quantity){
        if(!data.containsKey(id)) return false;
        CartProduct p = data.get(id);
        if(quantity<1) return false;
        p.setQuantity(quantity);
        data.put(id, p);
        return true;
    }

    //xoa mot san pham khoi gio hang
    public boolean remove(int id){
        return data.remove(id) != null;
    }

    //Lay ra danh sach cac san pham co trong gio hang
    public List<CartProduct> list(){
        return new ArrayList<CartProduct>(data.values());
    }

    //Tinh tong so luong tat ca san pham co trong gio hang
    public int getTotalQuantity(){
        AtomicInteger i = new AtomicInteger();
        data.values().forEach(cp -> i.addAndGet(cp.getQuantity()));
        return i.get();
    }

    //Ting tong tien cua gio hang
    public double getTotal(){
        AtomicReference<Double> res = new AtomicReference<>((double) 0);
        data.values().forEach(cp -> res.updateAndGet(v -> (v + cp.getQuantity() * cp.getPrice())));
        return res.get();
    }


    public List<CartProduct> getSelectedProducts(List<String> selectedProductIds) {
        return null;
    }
    public CartProduct convert(Product p){
        CartProduct cp = new CartProduct();
        cp.setName(p.getProName());
        cp.setPrice(p.getPrice());
        cp.setImg(p.getThumb());
        cp.setQuantity(1);
        return cp;
    }
}
