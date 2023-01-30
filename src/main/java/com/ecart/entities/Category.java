package com.ecart.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	
	private String categoryTitle;
	private String categorydescription;
	
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();
	
	
	public Category(int categoryId, String categoryTitle, String categorydescription) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categorydescription = categorydescription;
	}


	public Category(String categoryTitle, String categorydescription, List<Product> products) {
		super();
		this.categoryTitle = categoryTitle;
		this.categorydescription = categorydescription;
		this.products = products;
	}


	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public String getCategoryTitle() {
		return categoryTitle;
	}


	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}


	public String getCategorydescription() {
		return categorydescription;
	}


	public void setCategorydescription(String categorydescription) {
		this.categorydescription = categorydescription;
	}
	
	


	public List<Product> getProducts() {
		return products;
	}


	public void setProducts(List<Product> products) {
		this.products = products;
	}


	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categorydescription="
				+ categorydescription + "]";
	}
	
	
}
