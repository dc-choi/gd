package vo;

public class Store {
	private int storeId;
	private int managerStaffId;
	private int addressId;
	private String lastUpdate;
	
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public int getManagerStaffId() {
		return managerStaffId;
	}
	public void setManagerStaffId(int managerStaffId) {
		this.managerStaffId = managerStaffId;
	}
	public int getAdressId() {
		return addressId;
	}
	public void setAdressId(int adressId) {
		this.addressId = adressId;
	}
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
}
