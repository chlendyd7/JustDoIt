package list.linkedlist.implementation;

import java.util.ArrayList;
import java.util.Iterator;

public class AL {
	public static void main(String[] args) {
		ArrayList<Integer> numbers = new ArrayList<Integer>();
		
		numbers.add(10);
		numbers.add(20);
		numbers.add(30);
		numbers.add(40);
		System.out.println(numbers);
		
		numbers.add(1,50);
		System.out.println("\nadd(인덱스,값)");
		System.out.println(numbers);
		
		numbers.remove(1);
		System.out.println("\nadd(인덱스,값)");
		System.out.println(numbers);
		
		System.out.println("\nget(인덱스)");
		System.out.println(numbers.get(2));
		
		System.out.println("\nindexOf()");
        System.out.println(numbers.indexOf(30));

		
		Iterator <Integer>it = numbers.iterator();
		while(it.hasNext()) {
			int value = (int)it.next();
		}
		
		System.out.println("\nfor:");
		for(int value1:numbers) {
			System.out.println(value1);
			
		}
		System.out.println("\nfor");	
		for(int i =0; i<numbers.size();i++) {
			System.out.println(numbers.get(i));
		}
		
	}

}
