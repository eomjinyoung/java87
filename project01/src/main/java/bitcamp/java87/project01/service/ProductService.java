package bitcamp.java87.project01.service;

import java.util.Map;

import bitcamp.java87.project01.domain.Product;
import bitcamp.java87.project01.domain.Search;


public interface ProductService {
	
	public Map<String , Object> getProductList(Search search) throws Exception;

	public void addProduct(Product product)throws Exception;

	public Product getProduct(int prodNo)throws Exception;

	public void updateProduct(Product product)throws Exception;

	

	
}