public with sharing class ShoppingCartController {
    
    @AuraEnabled
    public static Cart_Item__c addToCart(String cartId,String foodId, Integer quantity) {
        System.debug('Received Food ID: ' + foodId);
        // Create new Cart if necessary
        Cart__c cart = new Cart__c();
        insert cart;  // Assuming Cart__c has no required fields except those set by default
        
        
        // Create new Cart Item
        Cart_Item__c cartItem = new Cart_Item__c();
        cartItem.Food__c = foodId;
        cartItem.l_Quantity__c = quantity;
        cartItem.Cart__c = cart.Id;
        insert cartItem;
      
        return cartItem;

       
    }
}
