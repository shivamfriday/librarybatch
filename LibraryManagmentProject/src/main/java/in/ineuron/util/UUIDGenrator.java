package in.ineuron.util;

import java.util.UUID;

public class UUIDGenrator {
	
	public static String  getUniqueId() {
		UUID uuid=UUID.randomUUID();
		String stringId = uuid.toString();
		return stringId;
	}
	 //Generates random UUID  
	//System.out.println(uuid);  
}
