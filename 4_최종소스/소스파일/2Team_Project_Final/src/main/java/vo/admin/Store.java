package vo.admin;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Store {
	private String storeId;
	private String name;
	private String phone;
	private String address;
	private String latitude;
	private String longitude;
	
	@Builder
	public Store(String storeId, String name, String phone, String address, String latitude, String longitude) {
		super();
		this.storeId = storeId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
	}
}
