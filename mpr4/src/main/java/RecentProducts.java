/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author kayen
 */

import java.util.LinkedList;

public class RecentProducts {
	LinkedList<Product> recentlyViewed;
	
	RecentProducts(){
		recentlyViewed = new LinkedList<Product>();
	}
	void addProduct(Product p) {
		// Check if product is already in the list
		// If yes, remove that product and append to first of list
		// If not, just add product while checking size
		if(isInList(p.plushieID)) {
			removeProduct(p.plushieID);
			recentlyViewed.addFirst(p);
		}else if(recentlyViewed.size() < 5) {
			recentlyViewed.addFirst(p);
		}else {
			recentlyViewed.removeLast();
			recentlyViewed.addFirst(p);
		}
	}
	
	void removeProduct(int plushieID) {
		for(int i=0; i < recentlyViewed.size(); ++i) {
			if(recentlyViewed.get(i).plushieID == plushieID) {
				recentlyViewed.remove(i);
				return;
			}
		}
	}
	
	Boolean isInList(int plushieID) {
		for(int i=0; i < recentlyViewed.size(); ++i) {
			if(recentlyViewed.get(i).plushieID == plushieID) {
				return true;
			}
		}
		
		return false;
	}
}
