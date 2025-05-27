package com.example.ecommerce.Utils;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.OrderItemService;
import com.example.ecommerce.service.OrderService;
import com.example.ecommerce.service.UserService;

public class Test {
    public static void main(String[] args) throws Exception {
        OrderService orderService = OrderService.getInstance();
        OrderItemService orderItemService = OrderItemService.getInstance();
        UserService userService = UserService.getInstance();
        User user = userService.getUserByID(1);

        Order o1 = orderService.getOrderById(38);
        o1.setListOrderItem(orderItemService.getAllOrderItemByOrderId(o1.getId()));

        String hashCode  = o1.hashOrder();
        String signature = CipherUtils.createSignature(hashCode);

//        String privateKey = "MIIEqQIBADANBgkqhkiG9w0BAQEFAASCBJMwggSPAgEAAoH+CD28yGmXX666qyHLiryF+6ceoLf/+q0+I7gA9lb5Xf5iqRNLPepuYqbCCRIhpcuykA40tmLq1WC6VVwnj+dn7kTdiefpXH1jUNr5JwtlYFkFaJ4QBOfUJWOvdANJeKR4OqpKupUTS+1S5bJDmmJYtSwh1F78nG2j1oSGy1Lsoai6ra/mHPU1I6sUNiX9wI5haG4GUMRLDJVBWxrGgPqzAkgwWvMnTKRiPJNMS4xlWcKV4q+Hd6X2/WBWa1og/aukWR6f3IKWkn4G0aaE2YISg/g+3tZhRnIiVOoVsRlD9MSYezTtCWCFiI/UXsOKc4ekvQv+9upeeSSKNjxguusCAwEAAQKB/gLjEdPJfdB0pwsVWzceZPdsK6QU4VVBRHAB4UBq5o/BcnGVgznM+t+PWJER63yn18V0XI36KBcY/B20G13jrHqBYHSTrCINAPJNy5Ocf+aZOPZVzPnS9vQkME49aosbXsz6ZBRp7eke2fgCk4Eta7MII0/A+NCZ7hfTtF7dDW1SC5vu/zIWEM5v93cGYfxYpDqzskYu+ocbQvZiDsmT9itYzWMm+krgtUW5y4Nby2I31ZuHM3UlO5CdX21S6yfOS0OR9Kr6T6ilKY0+kBoHNaRPifc40RlUH0E1F+qucE0biuDJe/V4fkjVSsNgcFmSzW6QFlA55uGyPLDoVJV9An8zVZw4LPsZOWtWi45ny4rpk2lvAkm5ij5BZunP7JxnfDrmc7tgayUGg152yCH0TURSrEOhbSQzJbnNT/cBkb10n1JTGGtW10p6lL1ZUbjDpgqSTIENuQBwv7wgpNiKQUvna4zb8kzM/8ljO2nfjrIfk++nI2TgAClUApKLJtG/An8pGRD4ZL/gYLdVszvVzT6KXalcWJyDKmaYpsTutlOgUCjdpnqVLXUHhqaXj1mwSFImRUwQS0jAxMQRhEInR6lqVts9D7VKNBKcIMJk1cTU+UzG+zpmY7UDJWBpT3xpfS0CzDJBiFw92CVOjjBZQFNgcEfLHBKrv8nwj6H8a4nVAn8n3CnZVNQE2hkGsoZ5AgtzIwuTLuugLj/4+LhEwy0PDd+OYf709z1guVD4Wp5C3FxY9XnuNpkNPhXv3k+l4EyD6dI6w5NVcwZZ+HSujk4xXRSIVO9AgI5e/gJONrINaHZP06skfhg0dckiTFgBRwP4kR5dYZZKeNWebgDsG9BxAn8Yk2q4ftbWwD8hulpvkZpyd2vNUxfUv8g2RJPDA7iiRw0I7oKjLlmrNHPuccR6S+UECbBglgRdccylhOdiQdInSuUzcG9Cfj0aq+RTFBnuGV42JwlXLQyTYwhyMRv+oOIHqD/tPDOcr+IvRYvX80Voh/wGkzT/C2MgvWNqZIw5An8XVFEvISB8r/KYlySZVaENpp21P6GkTJ+dm8agLc7af/Jva4I4PkauRjxilcateSRM/bKetsv5YytuzhzlnLd6dgOFfC1PZx5uKMzazgyp3/b2c3Zk58iC5M7XHNgovLmaDw95h/fD8GxQiXeOD3p2M2PmdLFawWAZZevSOYHq";
        System.out.println(hashCode);
        System.out.println(signature);
//        boolean verify = CipherUtils.verify(hashCode, signature, user.getPublic_key());
//        orderService.updateSignature(o1.getId(), signature);
//        System.out.println(verify);
//
//        System.out.println(CipherUtils.verify(hashCode,o1.getSignature(), user.getPublic_key()));

    }
}
