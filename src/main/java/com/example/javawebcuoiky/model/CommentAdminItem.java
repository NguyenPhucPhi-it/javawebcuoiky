package com.example.javawebcuoiky.model;

public class CommentAdminItem {
    private Comment comment;
    private String  productName;
    private String  productImage;

    public CommentAdminItem(Comment comment, String productName, String productImage) {
        this.comment      = comment;
        this.productName  = productName;
        this.productImage = productImage;
    }
    public int    getId()       
        { 
            return comment.getId(); 
        }
    public String getMessage()   
       {
         return comment.getMessage(); 

       }
    public int    getRating()     
      { return comment.getRating(); }
    public Object getCreated_at() 
      { return comment.getCreated_at(); }
    public int    getId_user()  
        { return comment.getId_user(); }
    public int    getId_product() 
      { return comment.getId_product(); }
    public int    getId_order()   
      { return comment.getId_order(); }
    public int    getStatus()    
       { return comment.getStatus(); }
    public String getProductName() 
     { return productName; }
    public String getProductImage() 
    { return productImage; }
}