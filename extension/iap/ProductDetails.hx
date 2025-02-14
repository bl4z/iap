package extension.iap;

class ProductDetails
{
	
	public var productID(default, null): String;
    public var localizedTitle(default, null): String;
    public var localizedDescription(default, null): String;
    public var price(default, null): String;
    public var localizedPrice(default, null): String;
	public var type(default, null): String;		//(android)
	
	public function new(dynObj:Dynamic) 
	{
		// Handle both Android and iOS Ids
		productID = Reflect.hasField(dynObj, "productId")? Reflect.field(dynObj, "productId") : Reflect.field(dynObj, "productID");
		type = cast Reflect.field(dynObj, "type");
		localizedPrice = price = cast Reflect.field(dynObj, "price");
		localizedTitle = cast Reflect.field(dynObj, "title");
		#if ios
			localizedDescription = cast Reflect.field(dynObj, "localizedDescription");
		#else
			localizedDescription = cast Reflect.field(dynObj, "description");
		#end
	}
	
	public function toString() :String {
		var res:String = "ProductDetails: { ";
		if (Reflect.fields(this).length > 0) {
			for (fieldLabel in Reflect.fields(this)) {
				res += fieldLabel + ": " + Reflect.field(this, fieldLabel) + ", ";
			}
			res = res.substring(0, res.length - 1);
		}
		
		res += " }";
		return res;
	}
	
}