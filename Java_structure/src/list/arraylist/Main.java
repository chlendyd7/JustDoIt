package list.arraylist;

public class Main {

	public static void main(String[] args) {
		
		ArrayList numbers = new ArrayList();
		numbers.addLast(10);
		numbers.addLast(20);
		numbers.addLast(30);
		numbers.addLast(40);
		
		
		ArrayList.ListIterator li  = numbers.listIterator();
		
		while(li.hasNext()) {
			int number = (int)li.next();
			if(number == 30) {
				li.remove();
			}
		}
		System.out.print(numbers);
		
	}

}
//linkedlist 다음 노드의 주소를 저장한다