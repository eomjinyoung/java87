package bitcamp.java87.project01.dao;

import java.util.List;
import bitcamp.java87.project01.domain.Product;
import bitcamp.java87.project01.domain.Search;


public interface ProductDao {
	

	public List<Product> getProductList(Search search) throws Exception ;

	public int getTotalCount(Search search) throws Exception ;

	public void addProduct(Product product)throws Exception ;

	public Product getProduct(int prodNo)throws Exception ;

	public void updateProduct(Product product)throws Exception ;

	
}